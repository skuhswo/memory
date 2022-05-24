import SwiftUI


class EmojiMemoryGame: ObservableObject {
    static var emojis = ["🥎", "🚜", "🏒", "🏈", "🥍", "🏄🏼‍♀️", "🤼‍♂️", "🚛", "🎧", "🎗", "🎺", "🎬", "🐷", "🐰"]
    
    @Published private(set) var model: MemoryGame<String> = MemoryGame<String>(numberofpaisOfCards: 4, createCardContent: { pairIndex in emojis[pairIndex] })
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
