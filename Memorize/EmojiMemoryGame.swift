//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sean Tai on 7/2/20.
//  Copyright © 2020 Xiaoyu Tai. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var gameStore = createMemoryGame()
    
    private static func createMemoryGame() -> (game: MemoryGame<String>, themeName: String, themeColor: Color) {
        let themes = [
            EmojiMemoryGameTheme(cardContents: ["🍜", "🍣", "🥟", "🌭", "🍙", "🍚", "🍥", "🥗", "🌯", "🍕", "🍔", "🍱"], name: "Foods", color: .yellow),
            EmojiMemoryGameTheme(cardContents: ["🗽", "🗼", "🏰", "🏯", "🏟", "🎡", "🎢", "🎠", "⛲️", "⛱", "🏜", "🗻"], name: "Places", color: .red),
            EmojiMemoryGameTheme(cardContents: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🥏", "🎱", "🏓", "🏸", "🏒"], name: "Sports", color: .blue),
            EmojiMemoryGameTheme(cardContents: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮"], name: "Animals", pairOfCards: 8, color: .green),
            EmojiMemoryGameTheme(cardContents: ["☀️", "🌤", "☁️", "🌦", "🌧", "🌩", "❄️", "💨", "💦", "☔️", "🌈", "🌫"], name: "Weather", pairOfCards: 4, color: .purple),
            EmojiMemoryGameTheme(cardContents: ["😀", "🥺", "😅", "🤔", "🤣", "😇", "😉", "😍", "😋", "😜", "🧐", "🤩"], name: "Faces", pairOfCards: 3, color: .gray)
        ]
        var selectedTheme = themes.randomElement()!
        selectedTheme.cardContents.shuffle()
        
        return (MemoryGame<String>(cardContents: selectedTheme.cardContents, pairOfCards: selectedTheme.pairOfCards), selectedTheme.name, selectedTheme.color)
    }
    
    // MARK: - Access to model
    
    var score: Int {
        return gameStore.game.score
    }
    
    var themeName: String {
        return gameStore.themeName
    }
    
    var themeColor: Color {
        return gameStore.themeColor
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return gameStore.game.cards
    }
    
    // MARK: - Intent(s)
    
    func new() {
        gameStore = EmojiMemoryGame.createMemoryGame()
    }
    
    func choose(card: MemoryGame<String>.Card) {
        gameStore.game.choose(card: card)
    }
}
