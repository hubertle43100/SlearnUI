//
//  CoreDataBookwormApp.swift
//  CoreDataBookworm
//
//  Created by Hubert Le on 1/24/22.
//

import SwiftUI

@main
struct CoreDataBookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
