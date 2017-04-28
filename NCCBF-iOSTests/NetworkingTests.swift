//
//  NetworkingTests.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/21/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import XCTest
import Alamofire
@testable import NCCBF_iOS

class NetworkingTests: XCTestCase {
    
    func testNetworkingForLocationCount() {
        let testExpectation = expectation(description: "testNetworkingForLocationCount")
        let expectedLocationCount = 17
        
        var locations = [String: Int]()
        
        Alamofire.request(NCCBF2017EventScheduleDataURL).responseJSON { (dataResponse) in
            if let json = dataResponse.result.value,
                let array = json as? [Any] {
                for element in array {
                    if let dictionary = element as? [String: Any] {
                        if let locationValue = dictionary["location"] as? String {
                            if let value = locations[locationValue] {
                                locations[locationValue] = value + 1
                            } else {
                                locations[locationValue] = 1
                            }
                        }
                    }
                }
                
//                print(locations)
                XCTAssertEqual(locations.count, expectedLocationCount)
                testExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testNetworkingForImageCount() {
        let testExpectation = expectation(description: "testNetworkingForImageCount")
        let expectedImageCount = 33
        
        var imageNames = [String: Int]()
        
        Alamofire.request(NCCBF2017EventScheduleDataURL).responseJSON { (dataResponse) in
            if let json = dataResponse.result.value,
                let array = json as? [Any] {
                for element in array {
                    if let dictionary = element as? [String: Any] {
                        if let imagename = dictionary["imagename"] as? String {
                            if let value = imageNames[imagename] {
                                imageNames[imagename] = value + 1
                            } else {
                                imageNames[imagename] = 1
                            }
                        }
                    }
                }
                
//                print(imageNames)
                XCTAssertEqual(imageNames.count, expectedImageCount)
                testExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
