//
//  AppDelegate.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 2/15/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let dataController = DataController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        // Setup CoreData.
        let context = dataController.persistentContainer.viewContext
        
        // Instantiate the initial VC.
        let storyboard = UIStoryboard(name: "NCCBFTabBarController", bundle: Bundle.main)
        guard let tabBarController = storyboard.instantiateInitialViewController() as? UITabBarController,
            let nc0 = tabBarController.viewControllers?[0] as? UINavigationController,
            let eventCatalogTableVC = nc0.topViewController as? EventCatalogTableViewController else { fatalError("eventCatalogTableVC is not found.") }
        eventCatalogTableVC.context = context
        
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        do {
            let fetchResult = try context.fetch(fetchRequest)
            print(fetchResult.count)
            print("fetchRequest succeeded.")
        } catch {
            print(error)
            fatalError("fetchRequest failed.")
        }
        
        
        window?.rootViewController = tabBarController
        
        // Set events data.
        
        Networking.downloadJSON(from: NCCBFEventScheduleData2017URL) { json in
            do {
                let downloadedEvents = try JSONParser.parse(json: json, context: context)
                
                guard let tc = tabBarController as? UITabBarController else { return }
                guard let nc1 = tc.viewControllers?[1] as? UINavigationController else { return }
                guard let scheduleTableVC = nc1.topViewController as? ScheduleTableViewController else { return }
                scheduleTableVC.events = downloadedEvents
                
            } catch {
                print(error)
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

