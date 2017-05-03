//
//  DateFormatterExtension.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/29/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

extension DateFormatter {
    class var eventScheduleJSONDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sss'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        return dateFormatter
    }
}
