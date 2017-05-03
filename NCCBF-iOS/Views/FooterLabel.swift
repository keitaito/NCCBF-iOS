//
//  FooterLabel.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/7/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class FooterLabel: UILabel {
    
    init(text: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.text = text
        self.font = self.font.withSize(fontSize)
        self.textColor = UIColor.lightGray
        self.textAlignment = .center
        self.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
