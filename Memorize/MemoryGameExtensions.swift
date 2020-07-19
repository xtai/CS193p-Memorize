//
//  MemoryGameExtensions.swift
//  Memorize
//
//  Created by Sean Tai on 7/19/20.
//  Copyright © 2020 Xiaoyu Tai. All rights reserved.
//

import SwiftUI

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

extension Data {
    // just a simple converter from a Data to a String
    var utf8: String? { String(data: self, encoding: .utf8 ) }
}


extension Color {
    init(_ rgb: UIColor.RGB) {
        self.init(UIColor(rgb))
    }
}

extension UIColor {
    public struct RGB: Hashable, Codable {
        var red: CGFloat
        var green: CGFloat
        var blue: CGFloat
        var alpha: CGFloat
    }

    convenience init(_ rgb: RGB) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue, alpha: rgb.alpha)
    }

    public var rgb: RGB {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return RGB(red: red, green: green, blue: blue, alpha: alpha)
    }
}
