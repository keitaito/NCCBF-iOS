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
    @IBOutlet weak var urlButton: UIButton!
    
    // MARK: - Public Properties
    
    var configurationHandler: (() -> Void)?
    var urlOpeningHandler: ((URL) -> Void)?
    
    
    // MARK: - Public Methods
    
    func configure(with eventDetails: EventDetailsViewModel) {
        
        nameLabel.text = eventDetails.name
        scheduleLabel.text = eventDetails.schedule
        locationLabel.text = eventDetails.location
        detailsLabel.text = eventDetails.details
        
        if let url = eventDetails.url {
            urlButton.setTitle(url, for: .normal)
            urlButton.addTarget(self, action: #selector(openURL(_:)), for: .touchUpInside)
        } else {
            urlButton.removeFromSuperview()
        }
        
        if let configurationHandler = configurationHandler {
            configurationHandler()
        }
    }
    
    @objc func openURL(_ sender: UIButton) {
        guard let urlString = sender.titleLabel?.text else { return }
        guard let url = URL(string: urlString) else { return }
        
        urlOpeningHandler?(url)
    }
}
