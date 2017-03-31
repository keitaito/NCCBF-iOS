//
//  NSPredicateExtension.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/30/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

extension NSPredicate {
    convenience init(from startScheduleDate: ScheduleDate, to endScheduleDate: ScheduleDate) {
        self.init(format: "startAt >= %@ && endAt < %@", startScheduleDate.date as NSDate, endScheduleDate.date as NSDate)
    }
}
