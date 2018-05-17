//
//  String+NMExtensions.swift
//  Nami
//
//  Created by Matthew Fargo on 2018/05/08.
//  Copyright © 2018年 Matthew Fargo. All rights reserved.
//

import Foundation
import UIKit
extension String {
    
    public enum FontWeight {
        case Regular, Medium, Bold
    }
    
    static private let TRXFontNameRegular:String = "NotoSansJP-Regular"
    static private let TRXFontNameMedium:String = "NotoSansJP-Medium"
    static private let TRXFontNameBold:String = "NotoSansJP-Bold"
    
    private static func nmFont(_ weight:FontWeight, _ size: CGFloat) -> UIFont {
        switch weight {
        case FontWeight.Bold:
            return UIFont(name: String.TRXFontNameBold, size: size)!
        case FontWeight.Medium:
            return UIFont(name: String.TRXFontNameMedium, size: size)!
        default:
            return UIFont(name: String.TRXFontNameRegular, size: size)!
        }
    }
    func nmAttributedString(_ size:CGFloat, _ weight:FontWeight, _ color:UIColor, _ alignment: NSTextAlignment) -> NSMutableAttributedString {
        return String.getAttributedStringForText(text: self, font: String.nmFont(weight, size), alignment: alignment, color: color)
    }
    
    func nmAttributedString(_ size:CGFloat) -> NSMutableAttributedString {
        return self.nmAttributedString(size, FontWeight.Regular, .black, NSTextAlignment.left)
    }
    
    func nmAttributedString(_ size:CGFloat, _ weight: FontWeight) -> NSMutableAttributedString {
        return self.nmAttributedString(size, weight, .black, NSTextAlignment.left)
    }
    
    func nmAttributedString(_ size:CGFloat, _ weight: FontWeight, _ color:UIColor) -> NSMutableAttributedString {
        return self.nmAttributedString(size, weight, color, NSTextAlignment.left)
    }
    
    static func getAttributedStringForText(text:String, font:UIFont?, alignment: NSTextAlignment, color:UIColor) -> NSMutableAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = alignment
        paragraph.lineHeightMultiple = 1.0
        paragraph.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        return NSMutableAttributedString(string: text, attributes: [NSAttributedStringKey.foregroundColor:color, NSAttributedStringKey.font:font!, NSAttributedStringKey.paragraphStyle:paragraph])
    }
    
}

