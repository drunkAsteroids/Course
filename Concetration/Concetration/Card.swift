//
//  Card.swift
//  Concetration
//
//  Created by Yury Sinev on 31.01.2020.
//  Copyright © 2020 asu. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
       static func getUniqueIdentifier() -> Int {
           Card.identifierFactory += 1
           return Card.identifierFactory
       }
       
       init() {
           self.identifier = Card.getUniqueIdentifier()
       }
}
