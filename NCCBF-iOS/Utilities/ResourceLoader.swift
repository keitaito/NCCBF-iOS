//
//  ResourceLoader.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/3/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

class ResourceLoader {
    class func load(resourceName: String, ofType type: String) -> [String: Any] {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: type) else {
            fatalError("Reading resource failed.")
        }
        guard let dictionary = NSDictionary(contentsOfFile: path) as? [String: Any] else {
            fatalError("dictionary instantiation failed.")
        }
        return dictionary
    }
}
