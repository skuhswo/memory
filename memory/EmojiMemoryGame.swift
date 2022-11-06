//
//  EmojiMemoryGame.swift
//  memory
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static var emojis = ["🥎", "🚜", "🏒", "🏈", "🥍", "🏄🏼‍♀️", "🤼‍♂️", "🚛", "🎧", "🎗", "🎺", "🎬", "🐷", "🐰"]
    
    @Published private(set) var model = MemoryGame<String>(numberofpaisOfCards: 4, createCardContent: { pairIndex in emojis[pairIndex] })
    
    // MARK: - Intents
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
