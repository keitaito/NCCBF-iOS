//
//  MoreInfoDetailViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/21/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class MoreInfoDetailViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var item: MenuItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        title = item?.title
        infoLabel.text = item?.info
    }
}
