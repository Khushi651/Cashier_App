//
//  Array+Add.swift
//  PyramidGold
//
//  Created by MAC on 23/11/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation

extension Array where Element ==  CustomizationCategoryOption {

    var string: String {

        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(self)

            return String(data: jsonData, encoding: .utf8)!

        } catch {

            return ""
        }
    }
}
