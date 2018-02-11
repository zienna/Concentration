//
//  Concentration.swift
//  Concentration
//
//  Created by Simone Zienna on 2/9/18.
//  Copyright © 2018 Simone Zienna. All rights reserved.
//

import Foundation

struct Concentration {
    
    var cards = Array<Card>()
    
    var indexOfTheOneAndOnlyCardFaceUp: Int? {
        get {
            //filter returns an Array that applied a function (or closure) to each element 
            return cards.indices.filter {cards[$0].isFaceUp}.oneAndOnly
//            let faceUpCardIndices = cards.indices.filter {cards[$0].isFaceUp}
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    //one card is set up so update index
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        //two cards are up now so restore to nil
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        
        set(newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    //picks card to return
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index is not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfTheOneAndOnlyCardFaceUp, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyCardFaceUp = index
            }
        }
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

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
