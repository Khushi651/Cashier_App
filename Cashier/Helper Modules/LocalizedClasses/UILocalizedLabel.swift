//
//  UILocalizedLabel.swift
//  ConfigureApp
//
//  Created by MAC on 01/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable final class UILocalizedLabel: UILabel {
    @IBInspectable var tableName: String? {
        didSet {
            guard let tableName = tableName else { text = text?.localized(tableName: "Localizable") ; return }
            text = text?.localized(tableName: tableName)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //text = text?.localized()
    }
    
}
