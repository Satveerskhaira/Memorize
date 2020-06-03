//
//  MemoryGame.swift
//  Memorize
//
//  Created by Satveer Singh on 5/24/20.
//  Copyright © 2020 Satveer Singh. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    private(set) var theme: Theme
    private(set) var score: Int = 0
    
    private var oneAndOnlyOneCardFaceUp: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card),!cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            // get card if already selected
            
            if let potentialMatchIndex = oneAndOnlyOneCardFaceUp {
                if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                    // increse score
                    score += 2
                } else {
                    if cards[chosenIndex].isSeen {
                        score -= 1
                    }
                    if cards[potentialMatchIndex].isSeen {
                        score -= 1
                    }
                }
                self.cards[chosenIndex].isFaceUp = true
                self.cards[chosenIndex].isSeen = true
            } else {
                
                oneAndOnlyOneCardFaceUp = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, theme: Theme, cardContentFactory: (Int) ->CardContent) {
        cards = Array<Card>()
        self.theme = theme
        for cardNumber in 0..<numberOfPairsOfCards {
            // Card will generate randamly so cardnumber passing is not required
            let content = cardContentFactory(cardNumber)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        self.cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id =  UUID()
        var isSeen = false
    } 
}


