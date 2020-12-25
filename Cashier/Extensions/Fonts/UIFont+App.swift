//
//  UIFont+App.swift
//  PyramidGold
//
//  Created by MAC on 17/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit

public struct FontStyle {
    static let Regular = "Regular"
    static let Medium = "Medium"
    static let Bold = "Bold"
    static let Light = "Light"
}


extension UIFont{
    
    static var AppFont = AvailableFonts.circular_medium
    static var AppBoldFont = AvailableFonts.circular_bold
    private struct AvailableFonts {
        static let circular_medium = "circularstd-medium"
        static let circular_bold = "circularstd-bold"
    }
    
    func getAppFontFamily()->String {
        let fontFamily = "\(UIFont.AppFont)-\(self.getFontStyle())"
        return fontFamily
    }
    
    func getFontStyle()->String {
        var fontStyle = ""
        if fontName.components(separatedBy: "-").count > 1 {
           fontStyle = fontName.components(separatedBy: "-")[1]
        }else{
            fontStyle = "Regular"
        }
        return fontStyle
    }
}
