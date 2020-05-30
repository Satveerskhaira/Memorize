//
//  MemoryGame.swift
//  Memorize
//
//  Created by Satveer Singh on 5/24/20.
//  Copyright © 2020 Satveer Singh. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card) {
                self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) ->CardContent) {
        cards = Array<Card>()
        for cardNumber in 0..<numberOfPairsOfCards {
            // Card will generate randamly so cardnumber passing is not required
            let content = cardContentFactory(cardNumber)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        self.cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id =  UUID()
    }
    
}
