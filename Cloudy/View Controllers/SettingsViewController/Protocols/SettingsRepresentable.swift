//
//  SettingsRepresentable.swift
//  Cloudy
//
//  Created by Fomin Nickolai on 20.09.17.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

protocol SettingsRepresentable {
    var text: String { get }
    var accessoryType: UITableViewCellAccessoryType { get }
}
