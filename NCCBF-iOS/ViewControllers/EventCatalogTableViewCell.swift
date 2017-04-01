//
//  EventCatalogTableViewCell.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/31/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class EventCatalogTableViewCell: UITableViewCell {
    class var ReuseIdentifier: String { return "\(type(of: self))" }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.layer.masksToBounds = true
        imageView?.layer.cornerRadius = min(imageView!.frame.width/2 , imageView!.frame.height/2)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView?.af_cancelImageRequest()
        imageView?.layer.removeAllAnimations()
        imageView?.image = nil
    }
    
    func configure(with event: Event) {
        self.textLabel?.text = event.name
        self.imageView?.configure(with: event)
    }

}
