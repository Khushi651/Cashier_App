//
//  UILabel+Add.swift
//  PyramidGold
//
//  Created by Suresh on 15/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    func setStrikeThrogh(text: String) {
        let attributeString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                     value: NSUnderlineStyle.single.rawValue,
                                     range: NSMakeRange(0, attributeString.length))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughColor, value: UIColor.lightGray, range: NSMakeRange(0, attributeString.length))
        self.attributedText = attributeString
    }
}
