//
//  Bundle.swift
//  PyramidGold
//
//  Created by MAC on 22/01/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

extension Bundle{
    var releaseVersionNumber: Double? {
        let strVersionStr =  self.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        return Double(strVersionStr)
    }

    var buildVersionNumber: String? {
        return self.infoDictionary?["CFBundleVersion"] as? String
    }
}
