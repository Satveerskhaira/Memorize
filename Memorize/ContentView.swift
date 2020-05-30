//
//  ContentView.swift
//  Memorize
//
//  Created by Satveer Singh on 5/24/20.
//  Copyright © 2020 Satveer Singh. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel : EmojiMemoryGame
    var body: some View {
        HStack{
            ForEach(viewModel.cards){ card in
                CardView(card: card)
                    .onTapGesture {
                        self.viewModel.choose(card: card)
                } 
                .font( self.viewModel.cards.count > 8 ? Font.body : Font.largeTitle)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .shadow(radius: 10)
    }
}

//MARK: Card View to show each card
struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius:10.0)
                    .stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
