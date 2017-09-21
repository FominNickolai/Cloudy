//
//  SettingsViewTemperatureViewModelTests.swift
//  CloudyTests
//
//  Created by Fomin Nickolai on 20.09.17.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewTemperatureViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: - Tests for Text
    
    func testText_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: temperatureNotation)
        XCTAssertEqual(viewModel.text, "Fahrenheit")
    }
    
    func testText_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: temperatureNotation)
        XCTAssertEqual(viewModel.text, "Celsius")
    }
    
    func testAccessoryType_Fahrenheit_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: temperatureNotation)
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }
    
    func testAccessoryType_Celsius_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: temperatureNotation)
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }
    
    func testAccessoryType_Fahrenheit_Celsius() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .celsius)
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }
    
    func testAccessoryType_Celsius_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        let viewModel = SettingsViewTemperatureViewModel(temperatureNotation: .fahrenheit)
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }
    
}












