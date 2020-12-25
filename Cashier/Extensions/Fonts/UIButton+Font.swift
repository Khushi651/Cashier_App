//
//  UIButton+Font.swift
//  PyramidGold
//
//  Created by MAC on 17/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    open override func awakeAfter(using coder: NSCoder) -> Any? {
        guard let titleLabel = self.titleLabel else {
            return super.awakeAfter(using: coder)
        }
       //titleLabel.font = UIFont(name: titleLabel.font.getAppFontFamily(), size: titleLabel.font.pointSize)
       return super.awakeAfter(using: coder)
    }
}

