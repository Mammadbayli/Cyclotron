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

