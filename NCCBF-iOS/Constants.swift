//
//  Constants.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/22/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

public let NCCBF2017EventScheduleDataURL = URL(string: "https://sfcherryblossom.org/wp-content/uploads/2017/ScheduleData/NCCBFSchedule.json")!
let NCCBF2017EventImageURL = URL(string: "https://sfcherryblossom.org/wp-content/uploads/2017/ScheduleData/Images/")!

let launchedBefore = "launchedBefore"

let NCCBF2017EventImagesString = "NCCBF2017EventImages"

enum ImageHandlingMessage: String {
    case foundInAppBundle = "Image is found in the app bundle. It will be displayed."
    case notFoundInAppBundle = "Image is not found in the app bundle. Check caches directory."
    case foundInCachesDirectory = "Image is found in caches directory. It will be displayed."
    case notFoundInCachesDirectory = "Image is not found in caches directory. Download image from the server."
    case saveDownloadedImageInCachesDirectory = "Image is donwloaded from the server. it is not found in caches directory. Save it."
    case writingImageSucceeded = "Writing the image succeeded."
}

func debugPrint(_ imageHandlingMessage: ImageHandlingMessage) {
    debugPrint(imageHandlingMessage.rawValue)
}
