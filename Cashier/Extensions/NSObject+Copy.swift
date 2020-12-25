//
//  NSObject+Copy.swift
//  PyramidGold
//
//  Created by MAC on 03/01/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

extension NSObject{
    
    func copyObject() -> NSObject {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! NSObject
    }
    
}
