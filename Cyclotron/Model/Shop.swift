//
//  Shop.swift
//  Cyclotron
//
//  Created by Javad on 11.06.22.
//

struct Shop {
    var id: String
    var location: Location
    var type: String
    var properties: ShopProperties
}


extension Shop: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case location = "geometry"
        case type
        case properties
    }
}

extension Shop: Identifiable {}

extension Shop {
    var shopListRowItem: ShopListRowItem {
        var item = ShopListRowItem(location: location)
        
        item.id = id
        item.title = properties.label
        item.freeRacks = properties.freeRacks
        item.bikes = properties.bikes
        item.racks = properties.bikeRacks
        item.type = type
        
        return item
    }
}
