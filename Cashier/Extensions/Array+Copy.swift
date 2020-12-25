//
//  Array+Copy.swift
//  PyramidGold
//
//  Created by MAC on 29/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation

protocol Copying {
    init(original: Self)
}

extension Copying {
    func copy() -> Self {
        return Self.init(original: self)
    }
}

extension Array where Element: Copying {
    func clone() -> Array {
        var copiedArray = Array<Element>()
        for element in self {
            copiedArray.append(element.copy())
        }
        return copiedArray
    }
}

extension Array{
    
    func copy() -> Array {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! Array
    }
    
}
