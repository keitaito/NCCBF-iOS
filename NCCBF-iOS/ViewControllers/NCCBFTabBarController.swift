//
//  NCCBFTabBarController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/29/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class NCCBFTabBarController: UITabBarController {
    
    var eventCatalogTableViewController: EventCatalogTableViewController {
        guard let nc = viewControllers?[0] as? UINavigationController,
            let vc = nc.topViewController as? EventCatalogTableViewController else {
                fatalError("EventCatalogTableViewController instantiation failed.")
        }
        return vc
    }
    
    var scheduleTableViewController: ScheduleTableViewController {
        guard let nc = viewControllers?[1] as? UINavigationController,
            let vc = nc.topViewController as? ScheduleTableViewController else {
                fatalError("ScheduleTableViewController instantiation failed.")
        }
        return vc
    }
    
    var mapViewController: MapViewController {
        guard let nc = viewControllers?[2] as? UINavigationController,
            let vc = nc.topViewController as? MapViewController else {
                fatalError("MapViewController instantiation failed.")
        }
        return vc
    }
    
    var moreInfoTableViewController: MoreInfoTableViewController {
        guard let nc = viewControllers?[3] as? UINavigationController,
            let vc = nc.topViewController as? MoreInfoTableViewController else {
                fatalError("MoreInfoTableViewController instantiation failed.")
        }
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
