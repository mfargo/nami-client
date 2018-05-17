//
//  NMCategoryView.swift
//  NamiClient
//
//  Created by Matthew Fargo on 2018/05/16.
//  Copyright © 2018年 Matthew Fargo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NMCategoryView: UIView, NMSliderDelegate {
    
    let identifier:Int
    private var sliders = [NMSlider]()
    
    init(_ frame: CGRect, _ data:[String:Any]) {
        identifier = data["id"] as! Int
        let l = UILabel()
        let title = data["name"] as! String
        let s = title.nmAttributedString(25, String.FontWeight.Regular, UIColor.white, NSTextAlignment.center)
        l.attributedText = s;
        let r = s.bounds()
        let padx:CGFloat = 30
        let pady:CGFloat = 12
        l.frame = CGRect(x: 0, y: 0, width: r.size.width + padx*2, height: r.size.height + pady*2)
        var y = l.frame.size.height + pady
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: y))
        
        l.backgroundColor = UIColor.nmGreenColor
        self.addSubview(l)
        
        if data["points"] == nil {
            return
        }
        
        let sliderHeight:CGFloat = 40
        let points = data["points"] as! [[String:Any]]
        for point in points {

            let nameLabel = UILabel(frame: CGRect(x: 0, y: y, width: self.frame.size.width, height: 30))
            //nameLabel.layer.borderColor = UIColor.nmBlackColor.cgColor
            //nameLabel.layer.borderWidth = 1
            y += nameLabel.frame.size.height
            addSubview(nameLabel)
            let slider = NMSlider(CGRect(x: padx*2, y: y, width: self.frame.size.width - padx*4, height: sliderHeight), point)
            sliders.append(slider)
            slider.delegate = self
            slider.frame.origin.y += (sliderHeight - slider.frame.size.height)/2
            slider.label = nameLabel
            slider.randomize()

            if point["unit"] == nil {
                y += 24
                let ticks:[String] = point["ticks"] as! [String]
                var x:CGFloat = slider.frame.origin.x;
                let increment:CGFloat = slider.frame.size.width / CGFloat(ticks.count - 1)
                
                for tick in ticks {
                    let text = tick.nmAttributedString(14, String.FontWeight.Regular, .nmGreyColor)
                    let size = text.bounds()
                    let t = UILabel(frame: CGRect(x: x - size.width/2 , y: y, width: size.width, height: sliderHeight))
                    t.attributedText = text
                    self.addSubview(t)
                    x += increment
                }
                y += sliderHeight + 24

            }
            else {
                let minl = UILabel(frame: CGRect(x: 0, y: y, width: self.frame.size.width, height: sliderHeight))
                let minString = String( slider.min) + slider.unit
                minl.attributedText = minString.nmAttributedString(14, String.FontWeight.Regular, .nmGreyColor)

                let maxl = UILabel(frame: CGRect(x: 0, y: y, width: self.frame.size.width, height: sliderHeight))
                let maxString = String(slider.max) + slider.unit
                maxl.attributedText = maxString.nmAttributedString(14, String.FontWeight.Regular, .nmGreyColor, NSTextAlignment.right)
                
                self.addSubview(minl)
                self.addSubview(maxl)
                y += sliderHeight + 12
            }
            self.addSubview(slider)
        }
        self.frame.size.height = y+sliderHeight
        
    }
    required init?(coder aDecoder: NSCoder) {
        identifier = 0
        super.init(coder: aDecoder)
    }

    private func normalized(_ positive:Bool = true) -> Float {
        var total:Float = 0
        for slider in sliders {
            total += slider.getNormalized()
        }
        if (positive) {
            return total / Float(sliders.count)
        }
        return 1 - (total / Float(sliders.count))
    }
    
    func getNormalized() -> Float {
        if (identifier == 0) {
            /*
            let maximum_heart_rate = 220 - NMSettings.user_age
            // target average heart rate is between 50 and 85 percent of max.
            let best:Float = 0.68 * Float(maximum_heart_rate)
            let dist = (sliders[1].value - best)
            print("best rate: ", best, dist)*/
            let dist = (fabsf(sliders[1].value - 60)/60)
            return (sliders[0].getNormalized() + (1 - dist))/2

        }
        return (identifier==2 || identifier==5) ? normalized(false) : normalized(true)
    }
    
    func getTotals() -> [Float] {
        var totals = [Float]()
        for slider in sliders {
            totals.append(slider.value)
        }
        return totals
    }

    func sliderCommitted(_ slider: NMSlider) {
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        let url = "http://"+NMSettings.baseUrl + String(NMSettings.user_id)
        let parameters:[String:Any] = [
            "type":identifier,
            "val": getNormalized(),
            "raw": getTotals()
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            //debugPrint(response)
        }

    }
}

