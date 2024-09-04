//
//  iDineApp.swift
//  iDine
//
//  Created by Chase Hashiguchi on 8/26/24.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
