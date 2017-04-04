//
//  ResponseParser.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/2/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

class ResponseParser {
    class func lastModifiedDate(from response: HTTPURLResponse) -> Date? {
        guard let headerFields = response.allHeaderFields as? [String: Any],
            let lastModifiedString = headerFields["Last-Modified"] as? String else {
                // lastModified header field is missing.
                 return nil
        }
        return lastModifiedString.date(with: "E, d MMM yyyy HH:mm:ss zzz")
    }
}
