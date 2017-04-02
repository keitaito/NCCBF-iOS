//
//  NCCBFNavigationController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/1/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class NCCBFNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationBar.barTintColor = .sakuraPink
    }
}
