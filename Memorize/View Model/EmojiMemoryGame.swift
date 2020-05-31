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
    
    // Convenient method to create game model
    static func createMemoryGame() -> MemoryGame<String> {
        var theme = createTheme()
        theme.emoji.shuffle()
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfCards , theme: theme) { pairIndex in
            return theme.emoji[pairIndex]
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
        model = EmojiMemoryGame.createMemoryGame()
    }
   // MARK: - Themes
    
   static func createTheme() -> Theme {
        var themes = [Theme]()
        themes.append(Theme(name: "Halloween", numberOfCards: 8, emoji: ["👻","🎃","☠️","💀","😈","✂️","👣","🧟‍♀️","🧟‍♂️","🦹🏿‍♀️","🥼","🦹🏻‍♂️","💉"], color: .orange))
        themes.append(Theme(name: "Faces" , numberOfCards: 12, emoji: ["😀","😁","😅","😂","🤣","😇","🙃","😌","😚","😛","😝","🤪","🤨","😎","🤩","🧐","😖","😭","🥳","😣","😳","😠"], color: .blue))
        themes.append(Theme(name: "Flags", numberOfCards: 6, emoji: ["🇹🇩","🇲🇷","🇲🇻","🏁","🇨🇦","🇹🇹","🇹🇼","🇦🇺","🇯🇲","🇻🇳","🇨🇭","🇹🇭","🇦🇹","🇹🇯","🇨🇷","🇨🇨","🇬🇧"], color: .gray))
        themes.append(Theme(name: "Games", numberOfCards: 15, emoji: ["⚽️","🏀","🏈","⚾️","🎱","🏓","🏸","🏒","🏏","⛳️","🪁","🎣","🥊","⛸","🥌","⛷","🚴‍♀️","🛹","🏐","🏉","🥏","🏂","🏹"], color: .blue))
        themes.append(Theme(name: "Symbols", numberOfCards: 6, emoji: ["®","©","℗","№","℔","℥","ℨ","ℬ","µ","Ω","ℹ︎","ℌ","ℑ","℞","ℳ","℀","℁","℅","℆","™","℠"], color: .red))
        themes.append(Theme(name: "Animals", numberOfCards: Int.random(in: 3..<10), emoji: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐸","🐵","🦄","🐙","🦕","🦑","🦉","🦞","🐒"], color: .yellow))
        return themes.randomElement()!
    }
}
