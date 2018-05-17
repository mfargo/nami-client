//
//  NMUserView.swift
//  NamiClient
//
//  Created by Matthew Fargo on 2018/05/16.
//  Copyright © 2018年 Matthew Fargo. All rights reserved.
//

import UIKit

class NMUserView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let name = "head_0"+String(NMSettings.user_id)
        let imageView = UIImageView(image:  UIImage(named: name))
        let size:CGFloat = 56
        imageView.frame.size = CGSize(width: size, height: size)
        print("NAME", name, imageView.frame)
        addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 100, y: 0, width: frame.size.width-100, height: size))
        label.attributedText = NMSettings.user_name.nmAttributedString(41, String.FontWeight.Regular, UIColor.nmGreyColor)
        addSubview(label)
        
        self.frame.size.height = imageView.frame.size.height + 40
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
