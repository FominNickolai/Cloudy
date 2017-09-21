//
//  WeekViewViewModelTests.swift
//  CloudyTests
//
//  Created by Fomin Nickolai on 21.09.17.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeekViewViewModelTests: XCTestCase {
    
    //MARK: - Properties
    
    var viewModel: WeekViewViewModel!
    
    //MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        //Load Stub
        let data = loadStubFromBundle(withName: "darksky", fileExtension: "json")
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
        
        //Initialize ViewModel
        viewModel = WeekViewViewModel(weatherData: weatherData.dailyData)
    }
    
    override func tearDown() {
        super.tearDown()
    }
   
    //MARK: - Tests fro Number of Sections
    
    func test_NumberOfSections() {
        XCTAssertEqual(viewModel.numberOfSections, 1)
    }
    
    //MARK: - Tests for Number of Days
    
    func test_NumberOfDays() {
        XCTAssertEqual(viewModel.weatherData.count, 8)
    }
    
    //MARK: - Tests for View Model for Index
    
    func test_ViewModelForIndex() {
        let weatherDayViewViewModel = viewModel.viewModel(for: 5)
        
        XCTAssertEqual(weatherDayViewViewModel.day, "Saturday")
        XCTAssertEqual(weatherDayViewViewModel.date, "July 15")
    }
    
}








