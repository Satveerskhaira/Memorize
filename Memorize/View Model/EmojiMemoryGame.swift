//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Satveer Singh on 5/24/20.
//  Copyright © 2020 Satveer Singh. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        let halloweenTheme = ["👻","🎃","☠️","💀","😈","👽","👣","🧟‍♀️","🧟‍♂️","🦹🏿‍♀️","🥼","🦹🏻‍♂️","👹"].shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
           return halloweenTheme[pairIndex]
        }
    }
    
    // MARK: - Access model
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    // MARK: - New game
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
        //model.cards.shuffle()
    }
}
