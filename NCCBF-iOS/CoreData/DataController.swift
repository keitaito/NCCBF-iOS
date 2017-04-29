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
        container.loadPersistentStores { (persistentStoreDescription, error) in
            error.map { print($0.localizedDescription) }
        }
        return container
    }()
}

extension DataController {
    
    var persistentContainerInMemory: NSPersistentContainer {
        let container = NSPersistentContainer(name: "NCCBF-iOS")
        
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores { (persistentStoreDescription, error) in
            error.map { print($0.localizedDescription) }
        }
        return container
    }
}
