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
        let facebook = MenuItem(title: "Facebook", url: URL(string: "https://www.facebook.com"), info: nil)
        let twitter = MenuItem(title: "Twitter", url: URL(string: "https://www.twitter.com"), info: nil)
        let instagram = MenuItem(title: "Instagram", url: URL(string: "https://www.instagram.com"), info: nil)
        let aboutPage = MenuItem(title: "About", url: nil, info: "This is about page.")
        let copyRightPage = MenuItem(title: "Copyright", url: nil, info: "This is copyright page.")
        return [facebook, twitter, instagram, aboutPage, copyRightPage]
    }
}
