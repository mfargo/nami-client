//
//  UIImage+NMExtensions.swift
//  Nami
//
//  Created by Matthew Fargo on 2018/05/08.
//  Copyright © 2018年 Matthew Fargo. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    static func colorImage(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    static func pathImage(path: UIBezierPath, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.blue.setStroke()
        path.lineWidth = 2
        path.stroke()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
