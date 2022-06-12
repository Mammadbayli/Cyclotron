//
//  ShopsManager.swift
//  Cyclotron
//
//  Created by Javad on 11.06.22.
//

import Foundation

@MainActor
class ShopsManager: ObservableObject {
    @Published var shops = [Shop]()
    
    func loadData() async {
        guard let data = await HTTP.sharedInstance.get(resource: Constants.backendURL.rawValue) else {
            return
        }
        
        do {
            let response = try JSONDecoder().decode(Response.self, from: data)
            self.shops = response.features
            print(Thread.isMainThread)
        } catch {
            print(error)
        }
        
    }
}
