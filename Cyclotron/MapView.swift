//
//  MapView.swift
//  Cyclotron
//
//  Created by Javad on 12.06.22.
//

import SwiftUI
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}

struct MapView: View {
    
    var markerLocation: CLLocation
    
    @State var region = MKCoordinateRegion(center: LocationManager.sharedInstance.currentLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    private var markers: [Marker] {
        [Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: markerLocation.coordinate.latitude, longitude: markerLocation.coordinate.longitude), tint: .red))]
    }

    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: markers) { marker in
            marker.location
        }.navigationBarTitleDisplayMode(.inline)
        
        
    }
}
