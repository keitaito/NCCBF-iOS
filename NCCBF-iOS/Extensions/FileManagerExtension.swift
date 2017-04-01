//
//  FileManagerExtension.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/31/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

// MARK: - NCCBF Extension

extension FileManager {
    class var NCCBF2017EventImagesCachesDirectory: URL {
        let cachesDirectory = FileManager.cachesDirectory
        return cachesDirectory.appendingPathComponent(NCCBF2017EventImagesString)
    }
}

// MARK: - General Usage Extension

extension FileManager {
    class var documentDirectory: URL {
        return FileManager.url(for: .documentDirectory)
    }
    
    class var cachesDirectory: URL {
        return FileManager.url(for: .cachesDirectory)
    }
    
    // Private Class Methods
    private class func url(for directory: FileManager.SearchPathDirectory) -> URL {
        return FileManager.default.urls(for: directory, in: .userDomainMask).last!
    }
}
