//
//  ScheduleDateFormatter.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/30/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

class ScheduleDateFormatter: DateFormatter {
    init(dateFormat: String) {
        super.init()
        self.dateFormat = dateFormat
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
