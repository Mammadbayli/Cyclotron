//
//  LocationManager.swift
//  Cyclotron
//
//  Created by Javad on 12.06.22.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    @Published var currentLocation = CLLocation()
    
    let locationManager = CLLocationManager()
    static let sharedInstance = LocationManager()
    
    
    private override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    
    func distance(to: CLLocation, from: CLLocation) -> Double {
        return to.distance(from: from)
    }
    
    func distanceFromCurrentLocation(to: CLLocation) -> Double {
        return distance(to: to, from: currentLocation)
    }
    
    func distancestringFromCurrentLocation(to: CLLocation) -> String {
        let distance = distance(to: to, from: currentLocation)
        
        var result = ""
        
        if distance >= 1000 {
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 3
            
            result = (formatter.string(from: NSNumber(value: distance/1000)) ?? "") + " km"
        } else {
            result = String(distance) + " m"
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
