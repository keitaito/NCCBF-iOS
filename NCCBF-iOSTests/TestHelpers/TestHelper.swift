//
//  TestHelper.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/29/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

class TestHelper {
    class func jsonFromBundle() -> Any {
        let filePath = Bundle.main.path(forResource: "NCCBFSchedule", ofType: "json")!
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: filePath))
            return try JSONSerialization.jsonObject(with: jsonData)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

extension TestHelper {
    class var startTimeDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "PDT")
        return dateFormatter
    }
}
