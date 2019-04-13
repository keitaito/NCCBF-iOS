//
//  UIImageViewExtension.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/31/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func configure(with event: Event) {
        guard let imageName = event.imageName else {
            self.image = UIImage(named: event.placeholderImageName)
            return
        }
        
        let imageConfigurator = ImageConfigurator(imageName: imageName)
        // 1. Load image from app bundle.
        if let appBundleImage = UIImage(named: imageName) {
            self.image = appBundleImage
        } else {
            // 2. Check caches directory.
            if FileManager.default.fileExists(atPath: imageConfigurator.imagePathURL.path),
                let image = imageConfigurator.loadImage() {
                // 3. Display image in caches directory.
                self.image = image
                return
            }
            // 4. Download image from the server.
            self.af_setImage(
                withURL: imageConfigurator.downloadImageURL,
                placeholderImage: UIImage(named: event.placeholderImageName),
                imageTransition: .crossDissolve(0.2),
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
