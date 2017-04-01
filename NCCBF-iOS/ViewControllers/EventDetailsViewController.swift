//
//  EventDetailsViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 2/26/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit
import AlamofireImage

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
        title = eventDetails.name
        
        setConfigurationHandler()
        detailsView.configure(with: eventDetails)
    }
    
    private func setConfigurationHandler() {
        detailsView.configurationHandler = { [weak self] in
            if let imageName = self?.eventDetails?.imageName {
                
                let imageConfigurator = ImageConfigurator(imageName: imageName)
                
                // 1. Load image from app bundle.
                if let appBundleImage = UIImage(named: imageName) {
                    NCCBF_iOS.debugPrint(.foundInAppBundle)
                    self?.detailsView.imageView.image = appBundleImage
                } else {
                    
                    // 2. Check caches directory.
                    NCCBF_iOS.debugPrint(.notFoundInAppBundle)
                    if FileManager.default.fileExists(atPath: imageConfigurator.imagePathURL.path) {
                        
                        // 3. Display image in caches directory.
                        NCCBF_iOS.debugPrint(.foundInCachesDirectory)
                        if let image = imageConfigurator.loadImage() {
                            self?.detailsView.imageView.image = image
                            return
                        }
                    }
                    
                    // 4. Download image from the server.
                    NCCBF_iOS.debugPrint(.notFoundInCachesDirectory)
                    self?.detailsView.imageView.af_setImage(
                        withURL: imageConfigurator.downloadImageURL,
                        placeholderImage: #imageLiteral(resourceName: "test-image"),
                        imageTransition: .crossDissolve(0.5),
                        runImageTransitionIfCached: false,
                        completion: { (dataResponse) in
                            guard let data = dataResponse.data else { return }
                            
                            // 5. Save downloaded image to caches directory.
                            if !FileManager.default.fileExists(atPath: imageConfigurator.imagePathURL.path) {
                                NCCBF_iOS.debugPrint(.saveDownloadedImageInCachesDirectory)
                                imageConfigurator.saveImageToCachesDirectory(imageData: data)
                            }
                    })
                }
                
            } else {
                self?.detailsView.imageView.image = #imageLiteral(resourceName: "placeholder")
            }
        }
    }
}
