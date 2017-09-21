//
//  WeatherDayViewViewModelTests.swift
//  CloudyTests
//
//  Created by Fomin Nickolai on 21.09.17.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeatherDayViewViewModelTests: XCTestCase {
    
    //MARK: - Properties
    
    var viewModel: WeatherDayViewViewModel!
    
    //MARK: Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        //Load Stub
        let data = loadStubFromBundle(withName: "darksky", fileExtension: "json")
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
        
        //Initialize View Model
        viewModel = WeatherDayViewViewModel(weatherDayData: weatherData.dailyData[5])
    }
    
    override func tearDown() {
        super.tearDown()
        
        //Reset User Defaults
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
    }
    
    //MARK: - Tests for Day
    
    func test_Day() {
        XCTAssertEqual(viewModel.day, "Saturday")
    }
    
    //MARK: - Test for Date
    
    func test_Date() {
        XCTAssertEqual(viewModel.date, "July 15")
    }
    
    //MARK: - Tests for Temperature
    
    func testTemperature_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        XCTAssertEqual(viewModel.temperature, "37 F - 47 F")
    }
    
    func testTemperature_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        XCTAssertEqual(viewModel.temperature, "3 C - 8 C")
    }
    
    //MARK: - Test for Wind Speed
    
    func testWindSpeed_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        XCTAssertEqual(viewModel.windSpeed, "1 MPH")
    }
    
    func testWindSpeed_Metric() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        XCTAssertEqual(viewModel.windSpeed, "2 KPH")
    }
    
    //MARK: - Tests for Image
    
    func testImage() {
        let viewModelImage = viewModel.image
        let imageDataViewModel = UIImagePNGRepresentation(viewModelImage!)!
        let imageDataReference = UIImagePNGRepresentation(UIImage(named: "cloudy")!)!
        
        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 236.0)
        XCTAssertEqual(viewModelImage!.size.height, 172.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }
    
}
















