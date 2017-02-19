//
//  JSON.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 2/19/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

enum ResourceLoaderError: Error {
    case loadingError(String, Any)
}

class ResourceLoader {
    
//    enum ResourceLoaderError: Error {
//        case loadingError(String, Any)
//    }
    
    init() {
    }
    
    public func load(resource: String, ofType type: String) throws -> URL {
        if let path = Bundle.main.path(forResource: resource, ofType: type) {
            return URL(fileURLWithPath: path)
        } else {
            throw ResourceLoaderError.loadingError("Resource was not found.", resource)
        }
    }
}
