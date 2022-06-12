//
//  HTTP.swift
//  Cyclotron
//
//  Created by Javad on 11.06.22.
//

import Foundation

class HTTP {
    
    static let sharedInstance = HTTP()
    
    func get(resource: String) async -> Data? {
        guard let url = URL(string: resource) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let response = try? await session.data(from: url)
        
        return response?.0
    }
    
    
    private init() {}
}
