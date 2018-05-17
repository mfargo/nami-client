//
//  NSAttributedString+NMExtensions.swift
//  Nami
//
//  Created by Matthew Fargo on 2018/05/08.
//  Copyright © 2018年 Matthew Fargo. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
    
    func bounds() -> CGRect {
        return boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
    }
    func bounds(width: CGFloat ) -> CGRect {
        return boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
    }
}
