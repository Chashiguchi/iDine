//
//  ContentView.swift
//  iDine
//
//  Created by Chase Hashiguchi on 8/26/24.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) {section in
                    Section(section.name) {
                        ForEach(section.items) {item in
                            Text(item.name)
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

#Preview {
    ContentView()
}
