//
//  ViewController.swift
//  Concentration
//
//  Created by Simone Zienna on 2/9/18.
//  Copyright © 2018 Simone Zienna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //gets initialized only when used but cannot
    //set didSet{} on lazy vars
    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    //not settable already without keyword private(set)
    var numberOfPairsOfCards: Int {
        get {
            return (cardButtons.count + 1) / 2
        }
    }
    
    
    var flipCount : Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
   
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    //private var emojiChoices = ["👻", "🎃", "🦇", "🙀", "😈", "😱", "🍭", "🍬"]
    private var emojiChoices = "👻🎃🦇🙀😈😱🍭🍬";

    
    private var emoji = [Card:String]()
    
    private func emoji(for card:Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            //this code doesn't work cuz Strings are not indexed by int but by String.Index
            //let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: Int(arc4random_uniform(UInt32(emojiChoices.count))))
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        //returns optional if it's set otherwise returns "?"
        return emoji[card] ?? "?"
    }
    
    private func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
        
    }
    
    override func viewDidLoad() {
        for index in cardButtons.indices {
            cardButtons[index].setTitle("", for: UIControlState.normal)
            cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
    }
    
}

