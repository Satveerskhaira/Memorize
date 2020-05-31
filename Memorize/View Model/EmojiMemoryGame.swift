//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Satveer Singh on 5/24/20.
//  Copyright © 2020 Satveer Singh. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame(with: EmojiMemoryGame.themes.randomElement()!)

    // Convenient method to create game model - change to init in future
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: (theme.numberOfCards ?? Int.random(in: 4..<8)) , theme: theme) { pairIndex in
            return theme.emoji.shuffled()[pairIndex]
        }
    }
    
 
    // MARK: - Access model
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var theme: Theme {
        model.theme
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    // MARK: - New game
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame(with: EmojiMemoryGame.themes.randomElement()!)
    }
    
    // MARK: - Themes
    static private var themes = [(Theme(name: "Halloween", numberOfCards: 8, emoji: ["👻","🎃","☠️","💀","😈","✂️","👣","🧟‍♀️","🧟‍♂️","🦹🏿‍♀️","🥼","🦹🏻‍♂️","💉"], color: .orange)),
                                 (Theme(name: "Faces" , numberOfCards: 12, emoji: ["😀","😁","😅","😂","🤣","😇","🙃","😌","😚","😛","😝","🤪","🤨","😎","🤩","🧐","😖","😭","🥳","😣","😳","😠"], color: .blue)),
                                 (Theme(name: "Flags", numberOfCards: 6, emoji: ["🇹🇩","🇲🇷","🇲🇻","🏁","🇨🇦","🇹🇹","🇹🇼","🇦🇺","🇯🇲","🇻🇳","🇨🇭","🇹🇭","🇦🇹","🇹🇯","🇨🇷","🇨🇨","🇬🇧"], color: .gray)),
                                 (Theme(name: "Games", numberOfCards: 15, emoji: ["⚽️","🏀","🏈","⚾️","🎱","🏓","🏸","🏒","🏏","⛳️","🪁","🎣","🥊","⛸","🥌","⛷","🚴‍♀️","🛹","🏐","🏉","🥏","🏂","🏹"], color: .blue)),
                                 (Theme(name: "Symbols", numberOfCards: 6, emoji: ["®","©","℗","№","℔","℥","ℨ","ℬ","µ","Ω","ℹ︎","ℌ","ℑ","℞","ℳ","℀","℁","℅","℆","™","℠"], color: .red)),
                                 (Theme(name: "Animals", emoji: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐸","🐵","🦄","🐙","🦕","🦑","🦉","🦞","🐒"], color: .yellow))
    ]
}
