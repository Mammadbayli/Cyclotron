//
//  ShopProperties.swift
//  Cyclotron
//
//  Created by Javad on 11.06.22.
//
import Foundation

struct ShopProperties {
    var freeRacks: Int
    var bikes: Int
    var label: String
    var bikeRacks: Int
    var updated: Date
}

extension ShopProperties: Codable {
    enum CodingKeys: String, CodingKey {
        case freeRacks = "free_racks"
        case bikes
        case label
        case bikeRacks = "bike_racks"
        case updated
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        label = try values.decode(String.self, forKey: .label)
        
        let freeRacksString = try values.decode(String.self, forKey: .freeRacks)
        let bikeRacksString = try values.decode(String.self, forKey: .bikeRacks)
        let bikesString = try values.decode(String.self, forKey: .bikes)
        
        freeRacks = Int(freeRacksString) ?? 0
        bikeRacks = Int(bikeRacksString) ?? 0
        bikes = Int(bikesString) ?? 0
        
        let updatedString = try values.decode(String.self, forKey: .bikes)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd hh:mm"
        
        updated = formatter.date(from: updatedString) ?? Date()
        
    }
}
