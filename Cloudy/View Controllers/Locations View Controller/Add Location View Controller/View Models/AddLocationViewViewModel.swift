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
import CoreLocation

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
    
    private lazy var geocoder = CLGeocoder()
    
    //MARK: - Initialization
    init(query: Driver<String>) {
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
        geocoder.geocodeAddressString(addressString) { [weak self] (placemarks, error) in
            var locations: [Location] = []
            
            self?._querying.value = false
            
            if let error = error {
                print("Unable to Forward Geocode Address (\(error)")
            } else if let _placemarks = placemarks {
                locations = _placemarks.flatMap({ (placemark) -> Location? in
                    
                    guard let name = placemark.name else { return nil }
                    guard let location = placemark.location else { return nil }
                    
                    return Location(name: name, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                })
            }
            
            self?._locations.value = locations
        }
    }
    
    
}













