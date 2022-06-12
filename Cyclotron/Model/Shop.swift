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
