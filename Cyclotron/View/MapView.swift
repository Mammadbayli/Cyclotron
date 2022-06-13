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
    var location: CLLocationCoordinate2D
    var bikes: Int
}

struct MapView: View {
    @ObservedObject var locationManager = LocationManager.sharedInstance
    @State var region = MKCoordinateRegion(center: LocationManager.sharedInstance.currentLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State var userTrackingMode = MapUserTrackingMode.follow
    
    var shopListItem: ShopListRowItem
    
    private var markers: [Marker] {
        [Marker(location: shopListItem.location.cllLocation.coordinate, bikes: shopListItem.bikes)]
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode,
                annotationItems: markers) { marker in
                MapAnnotation(coordinate: marker.location) {
                    AnnotationView(bikes: marker.bikes)
                }
            }.navigationBarTitleDisplayMode(.inline)
            
            ShopListRow(item: shopListItem, currentLocation: locationManager.currentLocation)
                .padding(.horizontal, 20)
        }
    }
}

struct AnnotationView: View {
    var bikes: Int
    
    var body: some View {
        HStack(spacing: 2) {
            ZStack {
                Color
                    .white
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                
                Image("Bike")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            
            Text(String(bikes))
                .font(.system(size: 20))
                .foregroundColor(.green)
                .bold()
        }
    }
}
