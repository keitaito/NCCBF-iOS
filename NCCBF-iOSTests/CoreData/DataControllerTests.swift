//
//  DataControllerTests.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/28/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import XCTest
@testable import NCCBF_iOS

class DataControllerTests: XCTestCase {
    
    func testDataControllerSetup() {
        // given
        let expectedPersistentContainerName = "NCCBF-iOS"
        
        // when
        let dataController = DataController()
        let persistentContainer = dataController.persistentContainer
        
        // then
        XCTAssertEqual(persistentContainer.name, expectedPersistentContainerName)
        XCTAssertNotNil(persistentContainer.viewContext)
    }
}
