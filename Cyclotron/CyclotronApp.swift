//
//  CyclotronApp.swift
//  Cyclotron
//
//  Created by Javad on 11.06.22.
//

import SwiftUI

@main
struct CyclotronApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
