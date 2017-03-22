//
//  Networking.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/22/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

class Networking {
    class func downloadJSON(from url: URL, completionHandler: @escaping (Any) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    completionHandler(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
