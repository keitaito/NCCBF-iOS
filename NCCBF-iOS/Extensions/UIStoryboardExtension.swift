//
//  UIStoryboardExtension.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 3/29/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

extension UIStoryboard {
    public class func instantiateViewController(withIdentifier identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: identifier, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
