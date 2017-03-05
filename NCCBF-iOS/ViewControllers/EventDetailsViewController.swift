//
//  EventDetailsViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 2/26/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    public var event = Event() {
        didSet {
            update()
        }
    }
    
    private var detailsView: EventDetailsView {
        return view as! EventDetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func update() {
        detailsView.configure(with: event)
        setupUI(with: event)
    }
    
    private func setupUI(with event: Event) {
        title = event.name
    }
}
