//
//  EventDetailsView.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 2/26/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit
import AlamofireImage

class EventDetailsView: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scheduleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    public func configure(with eventDetails: EventDetailsViewModel) {
        
        nameLabel.text = eventDetails.name
        scheduleLabel.text = eventDetails.schedule
        locationLabel.text = eventDetails.location
        
        detailsLabel.text = eventDetails.details
//        descriptionLabel.text = testText
        
        if let imageName = eventDetails.imageName {
            // 1. Load image from app bundle.
            if let appBundleImage = UIImage(named: imageName) {
                NCCBF_iOS.debugPrint(.foundInAppBundle)
                imageView.image = appBundleImage
            } else {
                NCCBF_iOS.debugPrint(.notFoundInAppBundle)
                // Check caches directory.
                let imagesCachesDirectory = FileManager.NCCBF2017EventImagesCachesDirectory
                let imagePathURL = imagesCachesDirectory.appendingPathComponent(imageName)
                if FileManager.default.fileExists(atPath: imagePathURL.path) {
                    do {
                        let imageData = try Data(contentsOf: imagePathURL)
                        guard let image = UIImage(data: imageData) else {
                            fatalError("image is nil.")
                        }
                        NCCBF_iOS.debugPrint(.foundInCachesDirectory)
                        imageView.image = image
                        return
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
                
                NCCBF_iOS.debugPrint(.notFoundInCachesDirectory)
                // 2. No image in app bundle. Downloa image from the server.
                let imageURL = NCCBF2017EventImageURL.appendingPathComponent(imageName)
                
                imageView.af_setImage(withURL: imageURL, placeholderImage: #imageLiteral(resourceName: "test-image"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(1.0), runImageTransitionIfCached: false, completion: { (dataResponse) in
                    guard let data = dataResponse.data else { return }
                    
                    if !FileManager.default.fileExists(atPath: imagePathURL.path) {
                        NCCBF_iOS.debugPrint(.saveDownloadedImageInCachesDirectory)
                        let dispatchQueue = DispatchQueue(label: "saving_image_nccbf")
                        dispatchQueue.async {
                            do {
                                try data.write(to: imagePathURL)
                                NCCBF_iOS.debugPrint(.writingImageSucceeded)
                            } catch {
                                fatalError(error.localizedDescription)
                            }
                        }
                    }
                })
            }
            
        } else {
            imageView.image = #imageLiteral(resourceName: "placeholder")
        }
    }
}

//let testText = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
