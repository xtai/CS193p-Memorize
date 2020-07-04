//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sean Tai on 7/2/20.
//  Copyright © 2020 Xiaoyu Tai. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var game: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🍜", "🍣", "🥟", "🌭", "🍙", "🍚", "🍥", "🥗", "🌯", "🍕", "🍔", "🍱"].shuffled()
        return MemoryGame<String>(numbersOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to model
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
