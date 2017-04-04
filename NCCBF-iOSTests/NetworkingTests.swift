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
    
    func testWithAlamofire() {
        
        let testExpectation = expectation(description: "testWithAlamofire")
        
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
                
                print(locations)
                testExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func tewtItemCount() {
        let testExpectation = expectation(description: "testImagenameCount")
        
        var ids = [Int: Int]()
        var imageNames = [String: Int]()
        
        
        Alamofire.request(NCCBF2017EventScheduleDataURL).responseJSON { (dataResponse) in
            if let json = dataResponse.result.value,
                let array = json as? [Any] {
                for element in array {
                    if let dictionary = element as? [String: Any] {
                        
                        if let id = dictionary["id"] as? Int {
                            if let value = ids[id] {
                                ids[id] = value + 1
                            } else {
                                ids[id] = 1
                            }
                        }
                        
                        
                        
                        if let imagename = dictionary["imagename"] as? String {
                            if let value = imageNames[imagename] {
                                imageNames[imagename] = value + 1
                            } else {
                                imageNames[imagename] = 1
                            }
                        }
                    }
                }
//                print(ids)
//                print(ids.count)
//                print("\n\n\n------\n\n\n")
//                print(imageNames)
//                print(imageNames.count)
                testExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
