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
        
        setupUI()
        
        setupCacheDownloadedImageDirectory()

        // Set up CoreData.
        let context = dataController.persistentContainer.viewContext
        
        let isLaunchedBefore = UserDefaults.standard.bool(forKey: launchedBefore)
        if isLaunchedBefore {
            setupChildVC()
            return
        }
        
        let spinner = UIActivityIndicatorView.largeSpinner
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        
        
        // Fetch event data from the server.
        Networking.downloadJSON(from: NCCBF2017EventScheduleDataURL) { json in
            do {
                _ = try JSONParser.parse(json: json, context: context)
                
                // Save events to CoreData.
                try context.save()
                print("context save succeeded.")
                
                UserDefaults.standard.set(true, forKey: launchedBefore)
                
                DispatchQueue.main.async {
                    spinner.stopAnimating()
                    spinner.removeFromSuperview()
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
    
    private func setupUI() {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: UIApplication.shared.statusBarFrame.size.height + 44))
        navBar.barTintColor = .sakuraPink
        view.addSubview(navBar)
        
        let tabBar = UITabBar(frame: CGRect(x: 0, y: view.bounds.size.height - 49, width: view.bounds.size.width, height: 49))
        view.addSubview(tabBar)
    }
    
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
        tc.mapViewController.context = context
    }
    
    private func setupCacheDownloadedImageDirectory() {
        if !FileManager.default.fileExists(atPath: FileManager.NCCBF2017EventImagesCachesDirectory.path) {
            do {
                try FileManager.default.createDirectory(at: FileManager.NCCBF2017EventImagesCachesDirectory, withIntermediateDirectories: false, attributes: nil)
            } catch {
                print(error); fatalError(error.localizedDescription)
            }
        }
    }
}
