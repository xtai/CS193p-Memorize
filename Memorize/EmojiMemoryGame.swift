//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sean Tai on 7/2/20.
//  Copyright © 2020 Xiaoyu Tai. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String> = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let themes = [
            MemoryGame<String>.Theme(cardContents: ["🍜", "🍣", "🥟", "🌭", "🍙", "🍚", "🍥", "🥗", "🌯", "🍕", "🍔", "🍱"], name: "Foods", pairOfCards: 3, color: .yellow),
            MemoryGame<String>.Theme(cardContents: ["🗽", "🗼", "🏰", "🏯", "🏟", "🎡", "🎢", "🎠", "⛲️", "⛱", "🏜", "🗻"], name: "Places", pairOfCards: 3, color: .red),
            MemoryGame<String>.Theme(cardContents: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🥏", "🎱", "🏓", "🏸", "🏒"], name: "Sports", pairOfCards: 3, color: .blue),
            MemoryGame<String>.Theme(cardContents: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮"], name: "Animals", pairOfCards: 3, color: .green),
            MemoryGame<String>.Theme(cardContents: ["☀️", "🌤", "☁️", "🌦", "🌧", "🌩", "❄️", "💨", "💦", "☔️", "🌈", "🌫"], name: "Weather", pairOfCards: 3, color: .purple),
            MemoryGame<String>.Theme(cardContents: ["😀", "🥺", "😅", "🤔", "🤣", "😇", "😉", "😍", "😋", "😜", "🧐", "🤩"], name: "Faces", pairOfCards: 3, color: .gray)
        ]
        return MemoryGame<String>(selectedTheme: themes.randomElement()!)
    }
    
    // MARK: - Access to model
    
    var score: Int {
        return game.score
    }
    
    var theme: MemoryGame<String>.Theme {
        return game.theme
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    // MARK: - Intent(s)
    
    func new() {
        game = EmojiMemoryGame.createMemoryGame()
    }
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
