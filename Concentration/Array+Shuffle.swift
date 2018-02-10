//
//  Array+Shuffle.swift
//  Concentration
//
//  Created by Simone Zienna on 2/9/18.
//  Copyright © 2018 Simone Zienna. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func shuffle() {
        for i in indices.reversed() {
            let j = arc4random_uniform( numericCast(i+1) )
            swapAt(i, numericCast(j))
        }
    }
    
    func shuffled() -> Array {
        var newArray = self
        newArray.shuffle()
        return newArray
    }
}
