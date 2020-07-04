//
//  ContentView.swift
//  Memorize
//
//  Created by Sean Tai on 7/1/20.
//  Copyright © 2020 Xiaoyu Tai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var game: EmojiMemoryGame
    var body: some View {
        HStack {
            ForEach(game.cards) { card in
                CardView(card: card).onTapGesture {
                    self.game.choose(card: card)
                }.aspectRatio(2/3, contentMode: .fit)
            }
        }
        .padding()
        .foregroundColor(Color.red)
        .font(game.cards.count >= 10 ? Font.body : Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: EmojiMemoryGame())
    }
}
