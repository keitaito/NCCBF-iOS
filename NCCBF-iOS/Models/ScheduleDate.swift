//
//  ScheduleDate.swift
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
    
    var date: Date {
        return Date.scheduleDate(self)
    }
}

enum ScheduleDateSegment: Int {
    case apr8  = 0
    case apr9  = 1
    case apr15 = 2
    case apr16 = 3
    
    var predicate: NSPredicate {
        switch self {
        case .apr8:
            return NSPredicate(from: .apr8, to: .apr9)
        case .apr9:
            return NSPredicate(from: .apr9, to: .apr10)
        case .apr15:
            return NSPredicate(from: .apr15, to: .apr16)
        case .apr16:
            return NSPredicate(from: .apr16, to: .apr17)
        }
    }
}
