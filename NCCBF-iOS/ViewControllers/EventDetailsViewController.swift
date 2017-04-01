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
        title = eventDetails.name
        
        setConfigurationHandler()
        detailsView.configure(with: eventDetails)
    }
    
    private func setConfigurationHandler() {
        detailsView.configurationHandler = { [weak self] in
            if let imageName = self?.eventDetails?.imageName {
                // 1. Load image from app bundle.
                if let appBundleImage = UIImage(named: imageName) {
                    NCCBF_iOS.debugPrint(.foundInAppBundle)
                    self?.detailsView.imageView.image = appBundleImage
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
                            self?.detailsView.imageView.image = image
                            return
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }
                    
                    NCCBF_iOS.debugPrint(.notFoundInCachesDirectory)
                    // 2. No image in app bundle. Downloa image from the server.
                    let imageURL = NCCBF2017EventImageURL.appendingPathComponent(imageName)
                    
                    self?.detailsView.imageView.af_setImage(withURL: imageURL, placeholderImage: #imageLiteral(resourceName: "test-image"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(1.0), runImageTransitionIfCached: false, completion: { (dataResponse) in
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
                self?.detailsView.imageView.image = #imageLiteral(resourceName: "placeholder")
            }
        }
    }
}
