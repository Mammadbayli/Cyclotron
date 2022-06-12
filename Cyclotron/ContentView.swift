//
//  ContentView.swift
//  Cyclotron
//
//  Created by Javad on 11.06.22.
//

import SwiftUI
import CoreData

struct ContentView: View {
  
    
    @ObservedObject var shopsManager = ShopsManager()
    @ObservedObject var locationManager = LocationManager.sharedInstance
    
    @MainActor
    var body: some View {
        NavigationView {
            List(shopsManager.shops) { shop in
                NavigationLink(destination: MapView(markerLocation: shop.location.cllLocation).navigationTitle(shop.properties.label)) {
                    HStack {
                        Text(shop.properties.label)
                        
                        Text(LocationManager.sharedInstance.distancestringFromCurrentLocation(to: shop.location.cllLocation))
                    }
                }
            }
        }.onAppear {
            Task {
                locationManager.startUpdatingLocation()
                await self.shopsManager.loadData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
