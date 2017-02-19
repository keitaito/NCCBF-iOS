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

struct ResourceLoader {
    public static func load(resource: String, ofType type: String) throws -> URL {
        if let path = Bundle.main.path(forResource: resource, ofType: type) {
            return URL(fileURLWithPath: path)
        } else {
            throw ResourceLoaderError.loadingError("Resource was not found.", resource)
        }
    }
}

enum JSONError: Error {
    case parsingError(String, Any)
}

struct JSONParser {
    public static func parse(json: Any) throws -> [Any] {
        var results = [Any]()
        if let topLevelArray = json as? [Any] {
            for element in topLevelArray {
                if let dictionary = element as? [String: Any] {
                    results.append(dictionary)
                } else {
                    throw JSONError.parsingError("Failed to do type casting from Any to [String: Any].", element)
                }
            }
        } else {
            throw JSONError.parsingError("Failed to do type casting from Any to [Any].", json)
        }
        return results
    }
}
