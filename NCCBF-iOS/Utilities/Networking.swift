//
//  Networking.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/22/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

//import Foundation
//import Alamofire
//import CoreData
//
//class Networking {
//    class func downloadJSON(from url: URL, completionHandler: @escaping (Any) -> Void) {
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print(error)
//            }
//            
//            if let data = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data)
//                    completionHandler(json)
//                } catch {
//                    print(error)
//                }
//            }
//        }
//        task.resume()
//    }
//}
//
//extension Alamofire.SessionManager {
//    func updateSchedule(context: NSManagedObjectContext, completionHandler: @escaping (Bool) -> Void) {
//        
//        var isUpdated = false
//        
//        self.request(NCCBF2017EventScheduleDataURL).responseJSON { (response) in
////            debugPrint(response)
//            guard let httpURLResponse = response.response else {
//                // httpURLResponse is nil.
//                return
//            }
//            guard let lastModifiedDate = ResponseParser.lastModifiedDate(from: httpURLResponse) else {
//                // lastModifiedDate is nil.
//                return
//            }
//            guard let savedDate = UserDefaults.standard.object(forKey: UserDefaultsKey.lastModified) as? Date else {
//                // lastModifiedDate is missing.
//                return
//            }
//            if lastModifiedDate.isLater(than: savedDate) {
//                // JSON is updated. Parse and instantiate objects.
//                guard let json = response.result.value else {
//                    // response result value is nil.
//                    return
//                }
//                
//                do {
//                    _ = try JSONParser.parse(json: json, context: context)
//                    
//                    // Delete existing objects.
//                    if try context.count(for: Event.fetchRequest()) > 0 {
//                        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Event.fetchRequest())
//                        try context.execute(batchDeleteRequest)
//                    }
//                    
//                    // Save events to CoreData.
//                    try context.save()
//                    debugPrint("context save succeeded.")
//                    
//                    // Save lastModifiedDate to UserDefaults.
//                    UserDefaults.standard.set(lastModifiedDate, forKey: UserDefaultsKey.lastModified)
//                    
//                    isUpdated = true
//                    
//                    DispatchQueue.main.async {
//                        completionHandler(isUpdated)
//                    }
//                    
//                } catch let JSONError.parsingError(error, json) {
//                    debugPrint(error)
//                    debugPrint(json)
//                } catch let EventError.initializingError(error, event) {
//                    debugPrint(error)
//                    debugPrint(event)
//                } catch {
//                    debugPrint("context save failed.")
//                    debugPrint(error)
//                }
//                
//            } else {
//                
//                isUpdated = false
//                
//                // JSON is not updated. Use the existing objects.
//                DispatchQueue.main.async {
//                    completionHandler(isUpdated)
//                }
//            }
//        }
//    }
//}

