//
//  NetworkingTests.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/21/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import XCTest

class NetworkingTests: XCTestCase {
    
    func testNetworking() {
        
        let networkingExpectation = expectation(description: "testNetworking")
        
        let url = URL(string: "http://sfcherryblossom.org/wp-content/uploads/2017/ScheduleData/NCCBFSchedule.json")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                    networkingExpectation.fulfill()
                } catch {
                    print(error)
                }
            }
        }.resume()
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                print(error)
            }
        }
    }
}
