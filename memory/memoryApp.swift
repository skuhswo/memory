//
//  memoryApp.swift
//  memory
//
//  Created by Stephan Kurpjuweit on 09.05.22.
//

import SwiftUI

@main
struct memoryApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

