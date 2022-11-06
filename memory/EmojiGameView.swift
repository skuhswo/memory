//
//  EmojiGameView.swift
//  memory


import SwiftUI

struct CardView: View {
    private let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingContents.cornerRadius)
                if card.isFaceUp {
                    shape.fill()
                         .foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingContents.lineWidth)
                    Text(card.content)
                        .font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                }
                else {
                    shape.fill()
                         .foregroundColor(.red)
                }
            }
        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingContents.fontScale)
    }
    
    private struct DrawingContents {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}

struct EmojiGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(game.model.cards, content: { card in
                    CardView(card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                })
            }
            .foregroundColor(.red)
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiGameView(game: game)
            .previewDevice("iPhone 13 Pro Max")
        EmojiGameView(game: game)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
