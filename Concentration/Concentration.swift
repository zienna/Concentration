//
//  Concentration.swift
//  Concentration
//
//  Created by Simone Zienna on 2/9/18.
//  Copyright © 2018 Simone Zienna. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = Array<Card>()
    
    //picks card to return
    func chooseCard(at index: Int) {
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            //since Card is a struct, each card is a copy
            cards.append(card)
            cards.append(card)
        }
        
        cards.shuffle()
        print(cards)
    }
    
    
}
