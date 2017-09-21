//
//  SettingsViewTemperatureViewModel.swift
//  Cloudy
//
//  Created by Fomin Nickolai on 20.09.17.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewTemperatureViewModel {
    
    //MARK: - Properties
    
    let temperatureNotation: TemperatureNotation
    
    //MARK: - Public Interface
    
    var text: String {
        switch temperatureNotation {
        case .fahrenheit:
            return "Fahrenheit"
        case .celsius:
            return "Celsius"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.temperatureNotation() == temperatureNotation {
            return .checkmark
        } else {
            return .none
        }
    }
    
}

extension SettingsViewTemperatureViewModel: SettingsRepresentable {
    
}
