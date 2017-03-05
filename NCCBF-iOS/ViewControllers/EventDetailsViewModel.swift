//
//  EventDetailsViewModel.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/5/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

struct EventDetailsViewModel {
    let event: Event
    
    let name: String
    let description: String
    
    init(event: Event) {
        self.event = event
        self.name = event.name
        self.description = event.description
    }
}
