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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    public func configure(with eventDetails: EventDetailsViewModel) {
        
        nameLabel.text = eventDetails.name
        scheduleLabel.text = eventDetails.schedule
        locationLabel.text = eventDetails.location
        
//        descriptionLabel.text = eventDetails.description
        imageView.image = #imageLiteral(resourceName: "placeholder")
    }
}
