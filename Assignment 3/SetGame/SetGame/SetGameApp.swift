//
//  SetGameApp.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import SwiftUI

@main
struct SetGameApp: App {
    var body: some Scene {
        WindowGroup { ContentView(viewModel: .init()) }
    }
}
