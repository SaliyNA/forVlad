//
//  WS23_Sessions_App.swift
//  WS23(Sessions)
//
//  Created by admin on 26.02.2023.
//

import SwiftUI

@main
struct WS23_Sessions_App: App {
    @ObservedObject var state: User = User()
    var body: some Scene {
        let isError = Binding<Bool>(get: {!self.state.error.isEmpty}, set: { _ in self.state.error = ""})
        WindowGroup {
                ContentView()
                .environmentObject(state)
            }
            
        }
    }
