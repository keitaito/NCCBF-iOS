//
//  ScheduleDate.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/30/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

enum ScheduleDate: String {
    case week1Day1 = "2018-04-14"
    case week1Day2 = "2018-04-15"
    case week1End = "2018-04-16"
    case week2Day1 = "2018-04-21"
    case week2Day2 = "2018-04-22"
    case week2End = "2018-04-23"
    
    var date: Date {
        return Date.scheduleDate(self)
    }
}

enum ScheduleDateSegment: Int {
    case week1Day1  = 0
    case week1Day2  = 1
    case week2Day1 = 2
    case week2Day2 = 3
    
    var predicate: NSPredicate {
        switch self {
        case .week1Day1:
            return NSPredicate(from: .week1Day1, to: .week1Day2)
        case .week1Day2:
            return NSPredicate(from: .week1Day2, to: .week1End)
        case .week2Day1:
            return NSPredicate(from: .week2Day1, to: .week2Day2)
        case .week2Day2:
            return NSPredicate(from: .week2Day2, to: .week2End)
        }
    }
}
