//
//  AddLocationViewViewModel.swift
//  Cloudy
//
//  Created by Fomin Nickolai on 21.09.17.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import RxSwift
import RxCocoa
import Foundation

class AddLocationViewViewModel {
    
    //MARK: - Properties
    
    private let disposeBag = DisposeBag()
    private let _locations = Variable<[Location]>([])
    private let _querying = Variable<Bool>(false)
    
    var querying: Driver<Bool> {
        return _querying.asDriver()
    }
    var locations: Driver<[Location]> {
        return _locations.asDriver()
    }
    
    var hasLocations: Bool {
        return numberOfLocations > 0
    }
    
    var numberOfLocations: Int {
        return _locations.value.count
    }
    
    private let locationService: LocationService
    
    //MARK: - Initialization
    init(query: Driver<String>, locationService: LocationService) {
        //Set Properties
        self.locationService = locationService
        query
            .throttle(0.5)
            .distinctUntilChanged()
            .drive(onNext: { [weak self] (addressString) in
                self?.geocode(addressString: addressString)
            })
            .disposed(by: disposeBag)
    }
    
    func location(at index: Int) -> Location? {
        guard index < _locations.value.count else { return nil }
        return _locations.value[index]
    }
    
    func viewModelForLocation(at index: Int) -> LocationRepresentable? {
        guard let location = location(at: index) else { return nil }
        return LocationsViewLocationViewModel(location: location.location, locationAsString: location.name)
    }
    
    //MARK: - Helpers Methods
    
    private func geocode(addressString: String?) {
        guard let addressString = addressString, !addressString.isEmpty else {
            _locations.value = []
            return
        }
        _querying.value = true
        
        //Geocode Address String
        locationService.geocode(addressString: addressString) { [weak self] (locations, error) in
            self?._querying.value = false
            self?._locations.value = locations
            
            if let error = error {
                print("Unable to Forward Geocode Address (\(error)")
            }
        }
    }
    
    
}













