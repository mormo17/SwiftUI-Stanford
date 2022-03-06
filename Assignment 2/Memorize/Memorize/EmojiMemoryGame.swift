//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mariam Ormotsadze on 1/30/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    private(set) var theme: Theme
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emojis: Array<String> = theme.emojis.shuffled()
        let numberOfPairsOfCards = theme.numberOfPairsOfCards ?? Int.random(in: 3...theme.emojis.count)
        
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    init(startingTheme: Theme? = nil) {
        let selectedTheme = startingTheme ?? themes.randomElement()!
        self.theme = selectedTheme
        model = EmojiMemoryGame.createMemoryGame(theme: selectedTheme)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func startNewGame() {
        let newTheme = themes.randomElement()!
        self.theme = newTheme
        model = EmojiMemoryGame.createMemoryGame(theme: newTheme)
    }
}
