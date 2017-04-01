//
//  ImageConfigurator.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/31/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

class ImageConfigurator {
    
    let imagesCachesDirectory = FileManager.NCCBF2017EventImagesCachesDirectory
    let imageName: String
    
    var imagePathURL: URL {
        return imagesCachesDirectory.appendingPathComponent(imageName)
    }
    
    init(imageName: String) {
        self.imageName = imageName
    }
    
    func loadImage() -> UIImage? {
        do {
            let imageData = try Data(contentsOf: imagePathURL)
            return UIImage(data: imageData)
//            self?.detailsView.imageView.image = image
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func saveImageToCachesDirectory(imageData: Data) {
        let url = imagePathURL
        let dispatchQueue = DispatchQueue(label: "NCCBF_iOS.ImageConfigurator.saveImageToCachesDirectory()")
        dispatchQueue.async {
            do {
                try imageData.write(to: url)
                NCCBF_iOS.debugPrint(.writingImageSucceeded)
            } catch {
                fatalError(error.localizedDescription)
            }
            
        }
    }
}
