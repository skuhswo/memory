//
//  memoryApp.swift
//  memory
//

import SwiftUI

@main
struct memoryApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiGameView(game: game)
        }
    }
}

