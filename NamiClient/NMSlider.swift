//
//  NMSlider.swift
//  NamiClient
//
//  Created by Matthew Fargo on 2018/05/16.
//  Copyright © 2018年 Matthew Fargo. All rights reserved.
//

import UIKit


protocol NMSliderDelegate {
    func sliderCommitted(_ slider:NMSlider)
}

class NMSlider: UISlider {

    let min:Int
    let max:Int
    let unit:String
    let title:String
    
    let isFloat:Bool
    
    var ticks:[String]?
    var delegate:NMSliderDelegate?

    var label:UILabel?
    
    init(_ frame: CGRect, _ point:[String:Any]) {
        title = point["name"] as! String
        if point["unit"] != nil {
            unit = point["unit"] as! String
            min = point["min"] as! Int
            max = point["max"] as! Int
            isFloat = true
        }
        else {
            ticks = point["ticks"] as! [String]
            unit = ""
            min = 0
            max = ticks!.count - 1
            isFloat = false
        }
        super.init(frame: frame)
        minimumValue = Float(min)
        maximumValue = Float(max)
        tintColor = UIColor.colorFromHexString("#F9B81B")
        self.addTarget(self, action: #selector(onChange), for: UIControlEvents.valueChanged)
        self.addTarget(self, action: #selector(onCommit), for: UIControlEvents.touchUpInside)
        self.addTarget(self, action: #selector(onCommit), for: UIControlEvents.touchUpOutside)
        
        self.setThumbImage(UIImage(named: "thumb"), for: UIControlState.normal)
    }
    required init?(coder aDecoder: NSCoder) {
        min = 0
        max = 1
        unit = ""
        title = ""
        isFloat = true
        super.init(coder: aDecoder)
    }
    
    @objc func onChange() {
        if (!isFloat) {
            value = roundf(value)
        }
        let s = (isFloat) ? title + " ： " + String(Int(floorf(value))) + unit : title + " ： " + ticks![Int(value)] + unit
        label?.attributedText = s.nmAttributedString(16, String.FontWeight.Regular, .nmBlackColor, NSTextAlignment.center)
    }
    
    @objc func onCommit() {
        delegate?.sliderCommitted(self)
    }
    
    func randomize() {
        value = Float(min) + Float(drand48() * (Double(max) - Double(min)))
        self.onChange()
    }
    
    func getNormalized() -> Float {
        return (value - Float(min)) / Float(max - min)
    }
}

