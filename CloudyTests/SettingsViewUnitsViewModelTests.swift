//
//  SettingsViewUnitsViewModelTests.swift
//  CloudyTests
//
//  Created by Fomin Nickolai on 20.09.17.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class SettingsViewUnitsViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        //MARK: - Reset UserDefaults
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
    }
    
    //MARK: - Tests for Text
    func testText_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        let viewModel = SettingsViewUnitsViewModel(unitsNotation: unitsNotation)
        XCTAssertEqual(viewModel.text, "Imperial")
    }
    
    func testText_Metric() {
        let unitsNotation: UnitsNotation = .metric
        let viewModel = SettingsViewUnitsViewModel(unitsNotation: unitsNotation)
        XCTAssertEqual(viewModel.text, "Metric")
    }
    
    func testAccessoryType_Imperial_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        let viewModel = SettingsViewUnitsViewModel(unitsNotation: unitsNotation)
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }
    
    func testAccessoryType_Metric_Metric() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        let viewModel = SettingsViewUnitsViewModel(unitsNotation: unitsNotation)
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.checkmark)
    }
    
    func testAccessoryType_Metric_Imperial() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .imperial)
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }
    
    func testAccessoryType_Imperial_Metric() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        let viewModel = SettingsViewUnitsViewModel(unitsNotation: .metric)
        XCTAssertEqual(viewModel.accessoryType, UITableViewCellAccessoryType.none)
    }
    
}















