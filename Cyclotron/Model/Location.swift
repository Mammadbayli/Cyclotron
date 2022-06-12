//
//  Location.swift
//  Cyclotron
//
//  Created by Javad on 11.06.22.
//

import CoreLocation

struct Location {
    var coordinate: Coordinate
    var type: String
}

extension Location: Codable {
    enum CodingKeys: String, CodingKey {
        case coordinate = "coordinates"
        case type
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let coordinates = try values.decode([Double].self, forKey: .coordinate)
        
        coordinate = Coordinate(x: coordinates.first ?? 0.0, y: coordinates.last ?? 0.0)
        type = try values.decode(String.self, forKey: .type)
    }
}

extension Location {
    var cllLocation: CLLocation {
        return CLLocation(latitude: coordinate.y, longitude: coordinate.x)
    }
}
