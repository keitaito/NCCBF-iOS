//
//  StringExtension.swift
//  NCCBF-iOS
//
//  Created by Keita Ito on 4/2/17.
//  Copyright © 2017 Keita Ito. All rights reserved.
//

import Foundation

extension String {
    func date(with dateFormat: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from: self)!
        return date
    }
}
