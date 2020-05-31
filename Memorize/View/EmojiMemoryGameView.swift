//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Satveer Singh on 5/24/20.
//  Copyright © 2020 Satveer Singh. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
        VStack{
            // Tittle and score
            header(title: viewModel.theme, score: viewModel.score)
            Spacer()
            Grid(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        self.viewModel.choose(card: card)
                } .padding(5)
            }
            .padding()
            .foregroundColor(Color.orange)
            .shadow(radius: 10)
            
            Spacer()
            
            // Create button for new random theme game
            Button("New Game") {
                // Create new game
                self.viewModel.newGame()
            }
            .frame(width: 300, height: 50 , alignment: .center)
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}

//MARK: - Card View to show each card
struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    // Convenient method
    func body(for size: CGSize) -> some View {
        ZStack{
            
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius:10.0)
                        .stroke(lineWidth: 3)
                    Text(self.card.content)
                } else {
                    if !self.card.isMatched {
                    RoundedRectangle(cornerRadius: 10.0)
                }
            }
        }
        .font(Font.system(size: fontSize(size: size)))
    }
    
    // MARK: - Drawing constants
    let cornerRadius: CGFloat = 10.0
    let lineWidth: CGFloat = 3.0
    func fontSize(size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

// MARK: - Create header

struct header: View {
    var title: String
    var score: Int
    var body: some View {
        VStack {
            Text("\(title) theme")
                .foregroundColor(.blue)
            Text("Score: \(score)")
                .foregroundColor(.green)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
