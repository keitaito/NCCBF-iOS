//
//  DateExtension.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/30/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

enum ScheduleDate: String {
    case apr8  = "2017-04-08"
    case apr9  = "2017-04-09"
    case apr10 = "2017-04-10"
    case apr15 = "2017-04-15"
    case apr16 = "2017-04-16"
    case apr17 = "2017-04-17"
}

extension Date {
    private static var scheduleDateFormatter: ScheduleDateFormatter {
        return ScheduleDateFormatter(dateFormat: "yyyy-MM-dd")
    }
    
    static func scheduleDate(_ scheduleDate: ScheduleDate) -> Date {
        let dateString = scheduleDate.rawValue
        return Date.scheduleDateFormatter.date(from: dateString)!
    }
}


