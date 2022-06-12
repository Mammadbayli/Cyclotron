//
//  LocationManager.swift
//  Cyclotron
//
//  Created by Javad on 12.06.22.
//

import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject {
    @Published var currentLocation = CLLocation()
    
    let locationManager = CLLocationManager()
    static let sharedInstance = LocationManager()
    
    
    private override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func distanceFromCurrentLocation(to: CLLocation) -> Double {
        return currentLocation.distance(from: to)
    }
    
    func distancestringFromCurrentLocation(to: CLLocation) -> String {
        let distance = distanceFromCurrentLocation(to: to)
        
        var result = ""
        
        let formatter = NumberFormatter()

        
        if distance >= 1000 {
            formatter.maximumFractionDigits = 3
            result = (formatter.string(from: NSNumber(value: distance/1000)) ?? "") + " km"
        } else {
            formatter.maximumFractionDigits = 0
            result = (formatter.string(from: NSNumber(value: distance)) ?? "") + " m"
        }
        

        
        return result
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocation = location
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}

