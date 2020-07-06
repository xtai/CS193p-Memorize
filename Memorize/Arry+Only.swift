//
//  Arry+Only.swift
//  Memorize
//
//  Created by Sean Tai on 7/4/20.
//  Copyright © 2020 Xiaoyu Tai. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
