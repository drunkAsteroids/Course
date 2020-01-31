//
//  ViewController.swift
//  Concetration
//
//  Created by Кирилл Смирнов on 12/02/2019.
//  Copyright © 2019 asu. All rights reserved.
//

import UIKit

enum Emoji: String {
    case cry = "😭"
    case scream = "😱"
    case raisedEyebrow = "🤨"
    case halo = "😇"
    case goofy = "🤪"
    case skull = "💀"
    case dog = "🐶"
    case monkey = "🐒"
    case bee = "🐝"
    case rabbit = "🐰"
    case linux = "🐧"
    case snail = "🐌"
    case skate = "🛹"
    case skyrim = "🏹"
    case kite = "🪁"
    case hockey = "🏒"
    case karate = "🥋"
    case sled = "🛷"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var pointsLabel: UILabel!
    private let countLabelText = "Счетчик нажатий:"
    
    @IBOutlet var cardButtons: [UIButton]!
    
    lazy var game = Concentration(numberPairsOfCards: (self.cardButtons.count + 1) / 2 )
    
    var emoji: [Int: Emoji] = [:]
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func emojiButtonAction(_ sender: UIButton) {
        
        if let index = self.cardButtons.firstIndex(of: sender) {
            self.game.chooseCard(at: index)
            self.updateViewModel()
        } else {
            print("Unhandled Error!!!")
        }
    }
    
    @IBAction func NewGameAction(_ sender: UIButton) {
        for index in self.game.cards.indices {
            game.cards[index].isFaceUp = false
            game.cards[index].isMatched = false
        }
        
        game.score = 0
        pointsLabel.text = "Points: 0"
        game.cards.removeAll()
        game = Concentration(numberPairsOfCards: (self.cardButtons.count + 1) / 2 )
        game.selectRandomTheme()
        game.count = 0
        game.cards.shuffle()
        emoji.removeAll()
        
        updateViewModel()
    }
    
    func emoji(for card: Card) -> String {
        
        if self.emoji[card.identifier] == nil, game.emojiArray.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(game.emojiArray.count)))
            self.emoji[card.identifier] = game.emojiArray.remove(at: randomIndex)
        }
        
        return self.emoji[card.identifier]?.rawValue ?? "?"
    }
    
    func updateViewModel() {
        pointsLabel.text = "Points: \(game.score)"
        self.countLabel.text = "\(countLabelText) \(game.count)"
        for index in self.cardButtons.indices {
           
           let button = self.cardButtons[index]
           let card = self.game.cards[index]
           
           if card.isFaceUp {
               button.setTitle(self.emoji(for: card), for: .normal)
               button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           } else {
               button.setTitle("", for: .normal)
            button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.6910475492, blue: 0, alpha: 0) : game.currentTheme.backCardColor
           }
       }
   }
}
