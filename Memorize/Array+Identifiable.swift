//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Sean Tai on 7/4/20.
//  Copyright © 2020 Xiaoyu Tai. All rights reserved.
//

import Foundation

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
