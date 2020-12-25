//
//  UILocalizedButton.swift
//  ConfigureApp
//
//  Created by MAC on 01/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable final class UILocalizedButton: UIButton {
    
    @IBInspectable var tableName: String? {
        didSet {
            guard let tableName = tableName else {
                let title = self.title(for: .normal)?.localized(tableName: "Localizable")
                setTitle(title, for: .normal)
                return
            }
            let title = self.title(for: .normal)?.localized(tableName: tableName)
            setTitle(title, for: .normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
//        let title = self.title(for: .normal)?.localized()
//        setTitle(title, for: .normal)
    }
}
