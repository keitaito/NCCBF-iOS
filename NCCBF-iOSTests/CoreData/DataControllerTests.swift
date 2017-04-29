//
//  DataControllerTests.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/28/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import XCTest
import CoreData
@testable import NCCBF_iOS

class DataControllerTests: XCTestCase {
    
    func testDataControllerSetup() {
        // given
        let expectedPersistentContainerName = "NCCBF-iOS"
        
        // when
        let dataController = DataController()
        let persistentContainer = dataController.persistentContainerInMemory
        
        // then
        XCTAssertEqual(persistentContainer.name, expectedPersistentContainerName)
        XCTAssertNotNil(persistentContainer.viewContext)
        
        do {
            let request: NSFetchRequest<Event> = Event.fetchRequest()
            let count = try persistentContainer.viewContext.count(for: request)
            XCTAssertEqual(count, 0)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
