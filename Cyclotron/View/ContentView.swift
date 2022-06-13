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
    
    var shops: [Shop] {
        shopsManager.shops.sorted(by: { a, b in
            distanceOfItem(item: a.shopListRowItem) <= distanceOfItem(item: b.shopListRowItem)
        })
    }
    
    init() {
        UITableView.appearance().sectionFooterHeight = 0
    }
    
    @MainActor
    var body: some View {
        NavigationView {
            List(shops) { shop in
                let item = shop.shopListRowItem
                Section {
                    ZStack {
                        ShopListRow(item: item, currentLocation: locationManager.currentLocation)
                            .padding(.vertical, 5)
                            .cornerRadius(10)
                        
                        NavigationLink(destination: MapView(shopListItem: item).navigationTitle(item.title)) {
                        }.opacity(0)
                    }
                }
            }
            .navigationTitle("Shops")
        }
        .onAppear {
            Task {
                locationManager.startUpdatingLocation()
                await self.shopsManager.loadData()
            }
        }.navigationTitle("Shops")
    }
    
    func distanceOfItem(item: ShopListRowItem) -> Double {
        locationManager.currentLocation.distance(from: item.location.cllLocation)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
