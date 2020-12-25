//
//  String+CreditCard.swift
//  PyramidGold
//
//  Created by MAC on 13/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation

extension String{
    
    func formatCardNumber(reverse: Bool = false) -> String {
        var formattedString = String()
        let normalizedString = self.replacingOccurrences(of: " ", with: "")
        if reverse {
            formattedString = normalizedString
        } else {
            var idx = 0
            var character: Character
            while idx < normalizedString.count {
                let index = normalizedString.index(normalizedString.startIndex, offsetBy: idx)
                character = normalizedString[index]

                if idx != 0 && idx % 4 == 0 {
                    formattedString.append(" ")
                }

                formattedString.append(character)
                idx += 1
            }
        }

        return formattedString
    }
    
    func formatExpiryDate(reverse: Bool = false) -> String {
        var formattedString = String()
        let normalizedString = self.replacingOccurrences(of: "/", with: "")
        if reverse {
            formattedString = normalizedString
        } else {
            var idx = 0
            var character: Character
            while idx < normalizedString.count {
                let index = normalizedString.index(normalizedString.startIndex, offsetBy: idx)
                character = normalizedString[index]

                if idx == 2 {
                    formattedString.append("/")
                }
                formattedString.append(character)

                idx += 1
            }
        }

        return formattedString
    }
    
    
}
