//
//  DataController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/26/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation
import CoreData

class DataController: NSObject {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NCCBF-iOS")
        container.loadPersistentStores(completionHandler: { (persistentStoreDescription, error) in
            if let error = error {
                print(error)
            }
        })
        return container
    }()
    
}

