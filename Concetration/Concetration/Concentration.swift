//
//  Concetration.swift
//  Concetration
//
//  Created by Yury Sinev on 31.01.2020.
//  Copyright © 2020 asu. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUp: Int?
    
    func chooseCard(at index: Int) {
        
        if !self.cards[index].isMatched {
            
            if let matchIndex = self.indexOfOneAndOnlyFaceUp, matchIndex != index {
                if self.cards[matchIndex].identifier == self.cards[index].identifier {
                    self.cards[matchIndex].isMatched = true
                    self.cards[index].isMatched = true
                }
                self.cards[index].isFaceUp = true
                self.indexOfOneAndOnlyFaceUp = nil
                
            } else {
                for flipDownIndex in self.cards.indices {
                    self.cards[flipDownIndex].isFaceUp = false
                }
                self.cards[index].isFaceUp = true
                self.indexOfOneAndOnlyFaceUp = index
            }
            
        }
        
    }
    
    init(numberPairsOfCards: Int) {
        
        for _ in 0..<numberPairsOfCards {
            let card = Card()
            self.cards += [card, card]
        }
    }
}
