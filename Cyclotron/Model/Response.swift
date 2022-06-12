//
//  Response.swift
//  Cyclotron
//
//  Created by Javad on 11.06.22.
//

struct Response {
    var features: [Shop]
}

extension Response: Codable {
    enum CodingKeys: String, CodingKey {
        case features
    }
}
