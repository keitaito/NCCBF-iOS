//
//  ThumbnailView.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/2/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class ThumbnailView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = min(frame.width/2, frame.height/2)
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.sakuraPink.cgColor
    }
}
