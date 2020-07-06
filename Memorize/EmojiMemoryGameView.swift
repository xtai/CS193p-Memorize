//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Sean Tai on 7/1/20.
//  Copyright © 2020 Xiaoyu Tai. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    self.game.new()
                }, label: {
                    Text("New Game").padding()
                })
                Spacer()
                Text("Theme: \(self.game.theme.name)").padding()
                Text("Score: \(self.game.score)").padding()
            }
            Grid(game.cards) { card in
                    CardView(card: card).onTapGesture {
                        self.game.choose(card: card)
                    }
                    .padding(10)
            }
            .foregroundColor(self.game.theme.color)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(120-90), clockWise: true)
                        .padding(10).opacity(0.25)
                    Text(card.content)
                        .font(Font.system(size: fontSize(for: size)))
            }.cardify(isFaceUp: card.isFaceUp)
        }
    }

    // MARK: - Drawing Constants

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.6
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[2])
        return EmojiMemoryGameView(game: game)
    }
}
