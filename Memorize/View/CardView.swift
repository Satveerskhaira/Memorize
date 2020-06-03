//
//  CardView.swift
//  Memorize
//
//  Created by Satveer Singh on 6/2/20.
//  Copyright © 2020 Satveer Singh. All rights reserved.
//

import SwiftUI

//MARK: - Card View to show each card
struct CardView: View {
    var card: MemoryGame<String>.Card
    var gradient: LinearGradient
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    // Convenient method
    private func body(for size: CGSize) -> some View {
        ZStack{
            
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius:10.0)
                        .stroke(lineWidth: 3)
                    Circle().padding(5).opacity(0.3)
                    Text(self.card.content)
                     
                } else {
                    if !self.card.isMatched {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(gradient)
                }
            }
        }
        .font(Font.system(size: fontSize(size: size)))
    }
    
    // MARK: - Drawing constants
    private let cornerRadius: CGFloat = 10.0
    private let lineWidth: CGFloat = 3.0
    private func fontSize(size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        let card = game.cards[0]
        return CardView(card: card, gradient: LinearGradient(gradient: Gradient(colors: [Color.orange]), startPoint: .top, endPoint: .bottom))
    }
}
