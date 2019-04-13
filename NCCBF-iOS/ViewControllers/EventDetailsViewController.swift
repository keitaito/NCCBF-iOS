//
//  EventDetailsViewController.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 2/26/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit
import AlamofireImage
import SafariServices

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
        detailsView.urlOpeningHandler = { url in
            DispatchQueue.main.async {
                if !UIApplication.shared.canOpenURL(url) {
                    let alert = UIAlertController(title: nil, message: "URL is invalid.", preferredStyle: .alert)
                    self.present(alert, animated: true) {
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                            alert.dismiss(animated: true, completion: nil)
                        }
                    }
                } else {
                    let safariVC = SFSafariViewController(url: url)
                    self.present(safariVC, animated: true)
                }
            }
            
        }
        
        detailsView.configure(with: eventDetails)
    }
    
    private func setConfigurationHandler() {
        detailsView.configurationHandler = { [weak self] in
            guard let self = self else { return }
            guard let eventDetails = self.eventDetails else { return }

            guard let imageName = eventDetails.imageName else {
                self.detailsView.imageView.image = UIImage(named: eventDetails.placeholderImageName)
                return
            }

            let imageConfigurator = ImageConfigurator(imageName: imageName)
            // 1. Load image from app bundle.
            if let appBundleImage = UIImage(named: imageName) {
                self.detailsView.imageView.image = appBundleImage
            } else {
                // 2. Check caches directory.
                if FileManager.default.fileExists(atPath: imageConfigurator.imagePathURL.path),
                    let image = imageConfigurator.loadImage() {
                    // 3. Display image in caches directory.
                    self.detailsView.imageView.image = image
                    return
                }
                // 4. Download image from the server.
                self.detailsView.imageView.af_setImage(
                    withURL: imageConfigurator.downloadImageURL,
                    placeholderImage: UIImage(named: eventDetails.placeholderImageName),
                    imageTransition: .crossDissolve(0.5),
                    runImageTransitionIfCached: false,
                    completion: { (dataResponse) in
                        guard let data = dataResponse.data else { return }
                        // 5. Save downloaded image to caches directory.
                        if !FileManager.default.fileExists(atPath: imageConfigurator.imagePathURL.path) {
                            imageConfigurator.saveImageToCachesDirectory(imageData: data)
                        }
                })
            }
        }
    }
}
