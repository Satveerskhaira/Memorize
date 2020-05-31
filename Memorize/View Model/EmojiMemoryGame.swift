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
        let themeName = themes.keys.randomElement() ?? "HalloweenTheme"
        let theme = EmojiMemoryGame.themes[themeName]!.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 3...6), themeName: themeName) { pairIndex in
            return theme[pairIndex]
        }
    }
    
    // MARK: - Access model
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var theme: String {
        model.themeName
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
        print(model.themeName)
    }
   // MARK: - Themes
   static let themes = [
        "Halloween" : ["👻","🎃","☠️","💀","😈","✂️","👣","🧟‍♀️","🧟‍♂️","🦹🏿‍♀️","🥼","🦹🏻‍♂️","💉"], // total 13
        "Faces"      : ["😀","😁","😅","😂","🤣","😇","🙃","😌","😚","😛","😝","🤪","🤨","😎","🤩","🧐","😖","😭","🥳","😣","😳","😠"], // total 22
        "Flags"      : ["🇹🇩","🇲🇷","🇲🇻","🏁","🇨🇦","🇹🇹","🇹🇼","🇦🇺","🇯🇲","🇻🇳","🇨🇭","🇹🇭","🇦🇹","🇹🇯","🇨🇷","🇨🇨","🇬🇧"], // total 17
        "Games"      : ["⚽️","🏀","🏈","⚾️","🎱","🏓","🏸","🏒","🏏","⛳️","🪁","🎣","🥊","⛸","🥌","⛷","🚴‍♀️","🛹","🏐","🏉","🥏","🏂","🏹"], // total 23
        "Symbols"   : ["®","©","℗","№","℔","℥","ℨ","ℬ","µ","Ω","ℹ︎","ℌ","ℑ","℞","ℳ","℀","℁","℅","℆","™","℠"], // total 21
        "Animals"    : ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐸","🐵","🦄","🐙","🦕","🦑","🦉","🦞","🐒"] // total 22
    ]
    
}
