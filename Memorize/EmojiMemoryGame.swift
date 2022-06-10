//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Brian Seo on 2021-07-13.
//

// ViewModel in MVVM

import SwiftUI

class EmojiMemoryGame: ObservableObject { // Sometimes, connected to a network or something, or it creates one itself
    typealias Card = MemoryGame<String>.Card
    private static let emojis: [String] = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚨", "🚔", "🚍", "🚘", "⌚️", "📱", "💻", "⌨️", "🖥", "🖱", "🎥", "📠", "⏳", "🔋", "💸", "⚽️", "🏀", "🎾", "🏐", "🏉", "🥏", "🥏", "🎱", "🪀", "🏓"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
        
    // pricate means that only the ViewModel's code itself can see the model. Against changing things. Access control. No access from outside
    // private(set) can be seen from outside but can not be changed
    
    var cards: Array<Card> {
        model.cards
    }
    
    // Mark - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}


