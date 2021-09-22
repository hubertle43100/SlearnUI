//
//  HuliPizzaMultiApp.swift
//  Shared
//
//  Created by Hubert Le on 9/21/21.
//

import SwiftUI

@main
struct HuliPizzaMultiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(orderModel: OrderModel()).environmentObject(UserPreferences())
        }
    }
}
