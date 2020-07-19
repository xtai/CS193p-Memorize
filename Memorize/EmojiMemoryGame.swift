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
    
    private static func createMemoryGame() -> (game: MemoryGame<String>, themeName: String, themeColor: UIColor) {
        let themes = [
            EmojiMemoryGameTheme(name: "Foods", cardContents: ["🍜", "🍣", "🥟", "🌭", "🍙", "🍚", "🍥", "🥗", "🌯", "🍕", "🍔", "🍱"], pairOfCards: 12, color: UIColor.yellow),
            EmojiMemoryGameTheme(name: "Places", cardContents: ["🗽", "🗼", "🏰", "🏯", "🏟", "🎡", "🎢", "🎠", "⛲️", "⛱", "🏜", "🗻"], pairOfCards: 6, color: UIColor.red),
            EmojiMemoryGameTheme(name: "Sports", cardContents: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🥏", "🎱", "🏓", "🏸", "🏒"], pairOfCards: 4, color: UIColor.blue),
            EmojiMemoryGameTheme(name: "Animals", cardContents: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮"], pairOfCards: 8, color: UIColor.green),
            EmojiMemoryGameTheme(name: "Weather", cardContents: ["☀️", "🌤", "☁️", "🌦", "🌧", "🌩", "❄️", "💨", "💦", "☔️", "🌈", "🌫"], pairOfCards: 3, color: UIColor.purple),
            EmojiMemoryGameTheme(name: "Faces", cardContents: ["😀", "🥺", "😅", "🤔", "🤣", "😇", "😉", "😍", "😋", "😜", "🧐", "🤩"], pairOfCards: 3, color: UIColor.gray)
        ]
        let selectedTheme = themes.randomElement()!
        
        // Assignment 5, Task 2
        print((selectedTheme.json!).utf8!)
        
        return (MemoryGame<String>(cardContents: selectedTheme.cardContents.shuffled(), pairOfCards: selectedTheme.pairOfCards), selectedTheme.name, selectedTheme.color)
    }
    
    // MARK: - Access to model
    
    var score: Int {
        return gameStore.game.score
    }
    
    var themeName: String {
        return gameStore.themeName
    }
    
    var themeColor: UIColor {
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
