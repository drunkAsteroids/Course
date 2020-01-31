//
//  Concetration.swift
//  Concetration
//
//  Created by Yury Sinev on 31.01.2020.
//  Copyright © 2020 asu. All rights reserved.
//

import UIKit
import Foundation

class Concentration {
    var cards = [Card]()
    var currentTheme: Theme
    var emojiArray: [Emoji] = []
    var score = 0
    var count = 0
    
    var themes: [Theme] = [
        Theme(_emojiArray: [.cry, .goofy, .halo, .raisedEyebrow, .scream, .skull], _name: "Normal emojies", _backCardColor: #colorLiteral(red: 1, green: 0.6910475492, blue: 0, alpha: 1)),
        Theme(_emojiArray: [.bee, .dog, .rabbit, .linux, .monkey, .snail], _name: "Animal emojies", _backCardColor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)),
        Theme(_emojiArray: [.hockey, .karate, .kite, .skate, .skyrim, .sled], _name: "Sport emojies", _backCardColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
    ]
    
    var indexOfOneAndOnlyFaceUp: Int?
    
    func chooseCard(at index: Int) {
        
        if !self.cards[index].isMatched {
            
            if let matchIndex = self.indexOfOneAndOnlyFaceUp, matchIndex != index {
                if self.cards[matchIndex].identifier == self.cards[index].identifier {
                    self.cards[matchIndex].isMatched = true
                    self.cards[index].isMatched = true
                    score += 2
                }
                else {
                    score -= 1
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
    /// add theme one-liner
    func addTheme(emoji: [Emoji], name: String, backCardColor: UIColor) {
        themes.append(Theme(_emojiArray: emoji, _name: name, _backCardColor: backCardColor))
    }
    
    func selectRandomTheme() {
        currentTheme = themes[Int(arc4random_uniform(UInt32(self.themes.count)))]
        emojiArray = currentTheme.emoji
    }
    
    init(numberPairsOfCards: Int) {
        for _ in 0..<numberPairsOfCards {
            let card = Card()
            self.cards += [card, card]
        }
        
        self.cards.shuffle() //randomize cards
        currentTheme = themes[0]
        emojiArray = currentTheme.emoji
    }
}
