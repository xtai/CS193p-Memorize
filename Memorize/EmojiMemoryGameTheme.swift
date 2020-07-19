//
//  EmojiMemoryGameTheme.swift
//  Memorize
//
//  Created by Sean Tai on 7/10/20.
//  Copyright © 2020 Xiaoyu Tai. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameTheme: Codable {
    private(set) var name: String
    private(set) var cardContents: Array<String>
    private(set) var pairOfCards: Int
    private var colorRGB: UIColor.RGB
    
    var color: UIColor {
        get { return UIColor(colorRGB) }
    }
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json: Data?) {
        if json != nil, let theme = try? JSONDecoder().decode(EmojiMemoryGameTheme.self, from: json!) {
            self = theme
        } else {
            return nil
        }
    }
    
    init(name: String, cardContents: Array<String>, pairOfCards: Int, color: UIColor) {
        self.name = name
        self.cardContents = cardContents
        self.pairOfCards = pairOfCards
        self.colorRGB = color.rgb
    }
}
