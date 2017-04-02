//
//  UIActivityIndicatorViewExtension.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/1/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    class var largeSpinner: UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        let affineTransform = CGAffineTransform(scaleX: 2, y: 2)
        spinner.transform = affineTransform
        spinner.color = .sakuraPink
        return spinner
    }
}
