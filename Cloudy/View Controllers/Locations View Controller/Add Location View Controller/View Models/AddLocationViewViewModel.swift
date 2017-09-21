//
//  AddLocationViewViewModel.swift
//  Cloudy
//
//  Created by Fomin Nickolai on 21.09.17.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import Foundation
import CoreLocation

class AddLocationViewViewModel {
    
    //MARK: - Properties
    
    var queryingDidChange: ((Bool) -> ())?
    var locationsDidChange: (([Location]) -> ())?
    
    var query: String = "" {
        didSet {
            geocode(addressString: query)
        }
    }
    
    private var querying: Bool = false {
        didSet {
            queryingDidChange?(querying)
        }
    }
    private var locations: [Location] = [] {
        didSet {
            locationsDidChange?(locations)
        }
    }
    
    var hasLocations: Bool {
        return numberOfLocations > 0
    }
    
    var numberOfLocations: Int {
        return locations.count
    }
    
    private lazy var geocoder = CLGeocoder()
    
    func location(at index: Int) -> Location? {
        guard index < locations.count else { return nil }
        return locations[index]
    }
    
    func viewModelForLocation(at index: Int) -> LocationRepresentable? {
        guard let location = location(at: index) else { return nil }
        return LocationsViewLocationViewModel(location: location.location, locationAsString: location.name)
    }
    
    //MARK: - Helpers Methods
    
    private func geocode(addressString: String?) {
        guard let addressString = addressString, !addressString.isEmpty else {
            locations = []
            return
        }
        querying = true
        
        //Geocode Address String
        geocoder.geocodeAddressString(addressString) { [weak self] (placemarks, error) in
            var locations: [Location] = []
            
            self?.querying = false
            
            if let error = error {
                print("Unable to Forward Geocode Address (\(error)")
            } else if let _placemarks = placemarks {
                locations = _placemarks.flatMap({ (placemark) -> Location? in
                    
                    guard let name = placemark.name else { return nil }
                    guard let location = placemark.location else { return nil }
                    
                    return Location(name: name, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                })
            }
            
            self?.locations = locations
        }
    }
    
    
}













