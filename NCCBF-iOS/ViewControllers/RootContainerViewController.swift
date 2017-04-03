//
//  RootContainerViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/29/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class RootContainerViewController: UIViewController {
    
    let dataController = DataController()
    
    var sessionManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        return Alamofire.SessionManager(configuration: configuration)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        setupUserDefaults()
        setupCacheDownloadedImageDirectory()
        // Set up CoreData.
        let context = dataController.persistentContainer.viewContext
        
        let spinner = createSpinner()
        
        sessionManager.request(NCCBF2017EventScheduleDataURL).responseJSON { (response) in
            debugPrint(response)
            guard let httpURLResponse = response.response else {
                fatalError("httpURLResponse is nil.")
            }
            guard let lastModifiedDate = ResponseParser.lastModifiedDate(from: httpURLResponse) else { fatalError("lastModifiedDate is nil.")
            }
            guard let savedDate = UserDefaults.standard.object(forKey: UserDefaultsKey.lastModified) as? Date else {
                fatalError("lastModifiedDate is missing.")
            }
            if lastModifiedDate.isLater(than: savedDate) {
                // JSON is updated. Parse and instantiate objects.
                guard let json = response.result.value else {
                    fatalError("response result value is nil.")
                }
                
                do {
                    _ = try JSONParser.parse(json: json, context: context)
                    
                    // Delete existing objects.
                    if try context.count(for: Event.fetchRequest()) > 0 {
                        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Event.fetchRequest())
                        try context.execute(batchDeleteRequest)
                    }
                    
                    // Save events to CoreData.
                    try context.save()
                    debugPrint("context save succeeded.")
                    
                    // Save lastModifiedDate to UserDefaults.
                    UserDefaults.standard.set(lastModifiedDate, forKey: UserDefaultsKey.lastModified)
                    
                    DispatchQueue.main.async {
                        self.removeSpinner(spinner)
                        self.setupChildVC()
                    }
                    
                } catch let JSONError.parsingError(error, json) {
                    debugPrint(error)
                    debugPrint(json)
                } catch let EventError.initializingError(error, event) {
                    debugPrint(error)
                    debugPrint(event)
                } catch {
                    debugPrint("context save failed.")
                    debugPrint(error)
                }
                
            } else {
                // JSON is not updated. Use the existing objects.
                DispatchQueue.main.async {
                    self.setupChildVC()
                }
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
    
    private func setupUserDefaults() {
        if UserDefaults.standard.object(forKey: UserDefaultsKey.lastModified) == nil {
            UserDefaults.standard.set(Date.jan1st2017, forKey: UserDefaultsKey.lastModified)
        }
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
    
    private func createSpinner() -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView.largeSpinner
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        return spinner
    }
    private func removeSpinner(_ spinner: UIActivityIndicatorView) {
        spinner.stopAnimating()
        spinner.removeFromSuperview()
    }
    
}
