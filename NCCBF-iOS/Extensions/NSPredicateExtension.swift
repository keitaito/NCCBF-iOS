//
//  NSPredicateExtension.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/30/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

extension NSPredicate {
    convenience init(from startDate: ScheduleDate, to endDate: ScheduleDate) {
        let start = Date.scheduleDate(.apr8)
        let end = Date.scheduleDate(.apr9)
        self.init(format: "startAt >= %@ && endAt < %@", start as NSDate, end as NSDate)
    }
}
