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
    
    let sessionManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    var spinner: UIActivityIndicatorView?
    var context: NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        setupUserDefaults()
        setupCacheDownloadedImageDirectory()
        // Set up CoreData.
        context = dataController.persistentContainer.viewContext
        
        spinner = createSpinner()
        
        sessionManager.request(NCCBFConstant.eventScheduleDataURL).responseJSON { (response) in
//            debugPrint(response)
            
            switch response.result {
            case .success(_):
                if let context = self.context {
                    self.successHandling(response: response, context: context)
                }
                
            case .failure(_):
                self.errorHandling()
            }

        }
    }
    
    func successHandling(response: DataResponse<Any>, context: NSManagedObjectContext) {
        guard let httpURLResponse = response.response else {
            // httpURLResponse is nil.
            return
        }
        guard let lastModifiedDate = ResponseParser.lastModifiedDate(from: httpURLResponse) else {
            // lastModifiedDate is nil.
            return
        }
        guard let savedDate = UserDefaults.standard.object(forKey: UserDefaultsKey.lastModified) as? Date else {
            // lastModifiedDate is missing.
            return
        }
        if lastModifiedDate.isLater(than: savedDate) {
            // JSON is updated. Parse and instantiate objects.
            guard let json = response.result.value else {
                // response result value is nil.
                return
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
                    if let spinner = self.spinner {
                        self.removeSpinner(spinner)
                    }
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
    
    func errorHandling() {
        debugPrint("error is thorwn.")
        // If error is thrown, Load the default JSON file in the app bundle.
        let path = Bundle.main.path(forResource: "NCCBFSchedule", ofType: "json")!
        let data = NSData(contentsOfFile: path)!
        guard let context = context else { return }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data as Data)
            _ = try JSONParser.parse(json: json, context: context)
            
            // Delete existing objects.
            if try context.count(for: Event.fetchRequest()) > 0 {
                let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Event.fetchRequest())
                try context.execute(batchDeleteRequest)
            }
            
            // Save events to CoreData.
            try context.save()
            debugPrint("context save succeeded.")
            
            DispatchQueue.main.async {
                if let spinner = self.spinner {
                    self.removeSpinner(spinner)
                }
                self.setupChildVC()
            }
            
        } catch {
            print(error)
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
        let tc = UIStoryboard.instantiateViewController(withIdentifier: "NCCBFTabBarController") as! NCCBFTabBarController
        
        addChild(tc)
        tc.view.frame = view.frame
        view.addSubview(tc.view)
        tc.didMove(toParent: self)
        
        let context = dataController.persistentContainer.viewContext
        tc.eventCatalogTableViewController.context = context
        tc.scheduleTableViewController.context = context
        tc.mapViewController.context = context
        
//        tc.eventCatalogTableViewController.sessionManager = sessionManager
    }
    
    private func setupCacheDownloadedImageDirectory() {
        if !FileManager.default.fileExists(atPath: FileManager.NCCBF2017EventImagesCachesDirectory.path) {
            do {
                try FileManager.default.createDirectory(at: FileManager.NCCBF2017EventImagesCachesDirectory, withIntermediateDirectories: false, attributes: nil)
            } catch {
                print(error)
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
