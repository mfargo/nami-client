//
//  UIColor+NMExtensions.swift
//  Nami
//
//  Created by Matthew Fargo on 2018/05/08.
//  Copyright © 2018年 Matthew Fargo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let nmBlackColor = UIColor.colorFromHexString("#000000")
    static let nmWhiteColor = UIColor.colorFromHexString("#FFFFFF")
    static let nmGreenColor = UIColor.colorFromHexString("#7FD322")
    static let nmGreyColor = UIColor.colorFromHexString("#B2B2B2")

    
    func hexString() -> String {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }
    static func colorFromHexString(_ hexString: String) -> UIColor {
        var rgbValue:UInt64 = UInt64(0)
        let scanner:Scanner = Scanner(string: hexString)
        scanner.scanLocation = 1
        scanner.scanHexInt64(&rgbValue)
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16)/255.0, green: CGFloat((rgbValue & 0xFF00) >> 8)/255.0, blue: CGFloat(rgbValue & 0xFF)/255.0, alpha: 1)
    }
    func interpolateRGB(_ end: UIColor, _ fraction: CGFloat) -> UIColor? {
        let f = min(max(0, fraction), 1)
        
        guard let c1 = self.cgColor.components, let c2 = end.cgColor.components else { return nil }
        
        let r: CGFloat = (c1[0] + (c2[0] - c1[0]) * f)
        let g: CGFloat = (c1[1] + (c2[1] - c1[1]) * f)
        let b: CGFloat = (c1[2] + (c2[2] - c1[2]) * f)
        let a: CGFloat = (c1[3] + (c2[3] - c1[3]) * f)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
}
