//
//  RootContainerViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/29/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit
import CoreData

class RootContainerViewController: UIViewController {
    
    let dataController = DataController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up CoreData.
        let context = dataController.persistentContainer.viewContext
        
        let isLaunchedBefore = UserDefaults.standard.bool(forKey: launchedBefore)
        if isLaunchedBefore {
            setupChildVC()
            return
        }
        
        // Fetch event data from the server.
        Networking.downloadJSON(from: NCCBFEventScheduleData2017URL) { json in
            do {
                _ = try JSONParser.parse(json: json, context: context)
                
                // Save events to CoreData.
                try context.save()
                print("context save succeeded.")
                
                UserDefaults.standard.set(true, forKey: launchedBefore)
                
                DispatchQueue.main.async {
                    self.setupChildVC()
                }
                
            } catch let JSONError.parsingError(error, json) {
                print(error)
                print(json)
            } catch let EventError.initializingError(error, event) {
                print(error)
                print(event)
            } catch {
                print("context save failed.")
                print(error)
            }
        }
    }
    
    // MARK: - Private Methods
    private func setupChildVC() {
        guard let tc = UIStoryboard.instantiateViewController(withIdentifier: "NCCBFTabBarController") as? NCCBFTabBarController else {
            fatalError("NCCBFTabBarController instantiation failed.")
        }
        
        addChildViewController(tc)
        tc.view.frame = view.frame
        view.addSubview(tc.view)
        tc.didMove(toParentViewController: self)
        
        let context = dataController.persistentContainer.viewContext
        tc.eventCatalogTableViewController.context = context
        tc.scheduleTableViewController.context = context
    }
}
