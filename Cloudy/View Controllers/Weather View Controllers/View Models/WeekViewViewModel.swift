//
//  WeekViewViewModel.swift
//  Cloudy
//
//  Created by Fomin Nickolai on 19.09.17.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

struct WeekViewViewModel {
    
    //MARK: - Properties
    
    let weatherData: [WeatherDayData]
    
    private let dayFormatter = DateFormatter()
    private let dateFromatter = DateFormatter()
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfDays: Int {
        return weatherData.count
    }
    
    func viewModel(for index: Int) -> WeatherDayViewViewModel {
        return WeatherDayViewViewModel(weatherDayData: weatherData[index])
    }
    
}











