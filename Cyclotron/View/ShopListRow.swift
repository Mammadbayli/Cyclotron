//
//  ShopListRow.swift
//  Cyclotron
//
//  Created by Javad on 12.06.22.
//

import SwiftUI
import MapKit

struct ShopListRow: View {
    
    var item: ShopListRowItem
    var currentLocation: CLLocation
    
    var distance: Double {
        currentLocation.distance(from: item.location.cllLocation)
    }
    
    var distanceString: String {
        var result = ""
        
        let formatter = NumberFormatter()
        
        
        if distance >= 1000 {
            formatter.maximumFractionDigits = 1
            result = (formatter.string(from: NSNumber(value: distance/1000)) ?? "") + " km"
        } else {
            formatter.maximumFractionDigits = 0
            result = (formatter.string(from: NSNumber(value: distance)) ?? "") + " m"
        }
        
        
        
        return result
    }
    
    var body: some View {
        VStack{
            VStack {
                HStack {
                    Text(item.id)
                        .shopRowTitleText()
                    
                    Text(item.title)
                        .shopRowTitleText()
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text(distanceString)
                        .font(.system(size: 14))
                    
                    Text("• \(item.type)")
                        .smallGreyText()
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
            
            HStack(alignment: .center) {
                VStack {
                    Image("Bike")
                    
                    Text("Available bikes")
                        .smallGreyText()
                    
                    Text(String(item.bikes))
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                        .bold()
                }.frame(maxWidth: .infinity)
                
                VStack {
                    Image("Lock")
                    
                    Text("Available places")
                        .smallGreyText()

                    
                    Text(String(item.freeRacks))
                        .font(.system(size: 50))
                        .bold()
                }.frame(maxWidth: .infinity)
            }.padding(.vertical, 8)
            
        }
    }
    
}

struct ShopListRowItem {
    var id: String = ""
    var title: String = ""
    var bikes: Int = 0
    var freeRacks: Int = 0
    var racks: Int = 0
    var type: String = ""
    var location: Location
}
