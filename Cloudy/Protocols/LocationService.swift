//
//  LocationService.swift
//  Cloudy
//
//  Created by Fomin Nickolai on 21.09.17.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import Foundation

protocol LocationService {
    typealias LocationServiceCompletionHandler = ([Location], Error?) -> ()
    func geocode(addressString: String?, completionHandler: @escaping LocationServiceCompletionHandler)
}
