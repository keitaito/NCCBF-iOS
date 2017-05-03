//
//  ScheduleDateTests.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/29/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import XCTest
@testable import NCCBF_iOS

class ScheduleDateTests: XCTestCase {
    
    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = TimeZone(abbreviation: "PDT")
        return df
    }()
    
    func testScheduleDate() {
        // given
        let apr8Date = dateFormatter.date(from: "2017-04-08")!
        let apr9Date = dateFormatter.date(from: "2017-04-09")!
        let apr10Date = dateFormatter.date(from: "2017-04-10")!
        let apr15Date = dateFormatter.date(from: "2017-04-15")!
        let apr16Date = dateFormatter.date(from: "2017-04-16")!
        let apr17Date = dateFormatter.date(from: "2017-04-17")!
        
        // when
        let apr8 = ScheduleDate.apr8
        let apr9 = ScheduleDate.apr9
        let apr10 = ScheduleDate.apr10
        let apr15 = ScheduleDate.apr15
        let apr16 = ScheduleDate.apr16
        let apr17 = ScheduleDate.apr17
        
        // then
        XCTAssertEqual(apr8.date, apr8Date)
        XCTAssertEqual(apr9.date, apr9Date)
        XCTAssertEqual(apr10.date, apr10Date)
        XCTAssertEqual(apr15.date, apr15Date)
        XCTAssertEqual(apr16.date, apr16Date)
        XCTAssertEqual(apr17.date, apr17Date)
    }
    
    func testScheduleDateSegment() {
        // given
        let apr8Date = dateFormatter.date(from: "2017-04-08")!
        let apr9Date = dateFormatter.date(from: "2017-04-09")!
        let apr15Date = dateFormatter.date(from: "2017-04-15")!
        let apr16Date = dateFormatter.date(from: "2017-04-16")!
        
        let event = Event(context: DataController().persistentContainerInMemory.viewContext)
        var result = false
        
        // when
        let apr8 = ScheduleDateSegment.apr8
        let apr9 = ScheduleDateSegment.apr9
        let apr15 = ScheduleDateSegment.apr15
        let apr16 = ScheduleDateSegment.apr16
        
        // then
        event.startAt = apr8Date
        event.endAt = apr8Date
        result = apr8.predicate.evaluate(with: event)
        XCTAssertEqual(result, true)
        
        event.startAt = apr9Date
        event.endAt = apr9Date
        result = apr9.predicate.evaluate(with: event)
        XCTAssertEqual(result, true)
        
        event.startAt = apr15Date
        event.endAt = apr15Date
        result = apr15.predicate.evaluate(with: event)
        XCTAssertEqual(result, true)
        
        event.startAt = apr16Date
        event.endAt = apr16Date
        result = apr16.predicate.evaluate(with: event)
        XCTAssertEqual(result, true)
    }
}
