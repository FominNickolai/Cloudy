//
//  UIImage.swift
//  Cloudy
//
//  Created by Fomin Nickolai on 19.09.17.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// Returns Image Icon
    ///
    /// - Parameter name: Name of Image
    /// - Returns: UIImage Icon
    class func imageForIcon(withName name: String) -> UIImage? {
        switch name {
        case "clear-day", "clear-night", "rain", "snow", "sleet":
            return UIImage(named: name)
        case "wind", "cloudy", "partly-cloudy-day", "partly-cloudy-night":
            return UIImage(named: "cloudy")
        default:
            return UIImage(named: "clear-day")
        }
    }
}
