//
//  BuildVersion.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/7/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

class BuildVersion {
    
    let version: String
    let buildNumber: String
    
    var string: String {
        return "\(version) (\(buildNumber))"
    }
    
    init() {
        self.version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String

        self.buildNumber = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String

    }
}
