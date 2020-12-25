//
//  UINavigationController+Add.swift
//  ConfigureApp
//
//  Created by MAC on 01/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.filter({$0.isKind(of: ofClass)}).last {
            popToViewController(vc, animated: animated)
        }
    }
    
    func setTitleForgroundTitleColor(_ color: UIColor) {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color]
    }
    
    func setTitleForgroundTitleFont(_ font: UIFont) {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): font]
    }
    
}

extension UINavigationController {
   open override var preferredStatusBarStyle: UIStatusBarStyle {
     return .lightContent
   }
}
