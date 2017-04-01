//
//  EventDetailsView.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 2/26/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class EventDetailsView: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scheduleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Public Properties
    
    var configurationHandler: (() -> Void)?
    
    
    // MARK: - Public Methods
    
    func configure(with eventDetails: EventDetailsViewModel) {
        
        nameLabel.text = eventDetails.name
        scheduleLabel.text = eventDetails.schedule
        locationLabel.text = eventDetails.location
        detailsLabel.text = eventDetails.details
        
        if let configurationHandler = configurationHandler {
            configurationHandler()
        }
    }
}

//let testText = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
