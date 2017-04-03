//
//  MenuItem.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/21/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

class MenuItem {
    let title: String
    let url: URL?
    let info: String?
    
    init(title: String, url: URL?, info: String?) {
        self.title = title
        self.url = url
        self.info = info
    }
}

extension MenuItem {
    class func itemsForMoreInfoTableVC() -> [MenuItem] {
        
        let dictionary = ResourceLoader.load(resourceName: "MoreInfoMenuItem", ofType: "plist")
        
        let aboutDescription = dictionary["About"] as! String
        let copyrightDescription = dictionary["Copyright"] as! String
        let licensesDescription = dictionary["Licenses"] as! String
        
        let facebook = MenuItem(title: "Facebook", url: URL(string: "https://www.facebook.com/NCCBF"), info: nil)
        let twitter = MenuItem(title: "Twitter", url: URL(string: "https://twitter.com/NC_CBF"), info: nil)
        let instagram = MenuItem(title: "Instagram", url: URL(string: "https://instagram.com/NC_CBF"), info: nil)
        let aboutPage = MenuItem(title: "About", url: nil, info: aboutDescription)
        let copyRightPage = MenuItem(title: "Copyright", url: nil, info: copyrightDescription)
        let licensesPage = MenuItem(title: "Licenses", url: nil, info: licensesDescription)
        return [facebook, twitter, instagram, aboutPage, copyRightPage, licensesPage]
    }
}
