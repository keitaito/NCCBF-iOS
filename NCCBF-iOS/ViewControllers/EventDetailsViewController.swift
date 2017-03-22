//
//  EventDetailsViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 2/26/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    public var eventDetails: EventDetailsViewModel?
    
    private var detailsView: EventDetailsView {
        return view as! EventDetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    private func setupUI() {
        guard let eventDetails = eventDetails else { return }
        detailsView.configure(with: eventDetails)
        title = eventDetails.name
    }
}
