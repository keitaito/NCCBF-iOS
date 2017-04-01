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
            self.image = #imageLiteral(resourceName: "placeholder")
            return
        }
        
        let imageConfigurator = ImageConfigurator(imageName: imageName)
        
        // 1. Load image from app bundle.
        if let appBundleImage = UIImage(named: imageName) {
            NCCBF_iOS.debugPrint(.foundInAppBundle)
            self.image = appBundleImage
        } else {
            
            // 2. Check caches directory.
            NCCBF_iOS.debugPrint(.notFoundInAppBundle)
            if FileManager.default.fileExists(atPath: imageConfigurator.imagePathURL.path) {
                
                // 3. Display image in caches directory.
                NCCBF_iOS.debugPrint(.foundInCachesDirectory)
                if let image = imageConfigurator.loadImage() {
                    self.image = image
                    return
                }
            }
            
            // 4. Download image from the server.
            NCCBF_iOS.debugPrint(.notFoundInCachesDirectory)
            self.af_setImage(
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
    }
}
