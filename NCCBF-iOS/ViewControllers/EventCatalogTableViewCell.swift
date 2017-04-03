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
    
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        thumbnailView.af_cancelImageRequest()
        thumbnailView.layer.removeAllAnimations()
        thumbnailView.image = nil
    }
    
    func configure(with event: Event) {
        self.titleLabel.text = event.name
        self.thumbnailView.configure(with: event)
    }

}
