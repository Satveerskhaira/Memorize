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
        let gradient = LinearGradient(gradient: Gradient(colors: [viewModel.theme.color.opacity(0.25), viewModel.theme.color]), startPoint: .top, endPoint: .bottom)
        return NavigationView {
            VStack{
                //Create cards
                Grid(viewModel.cards) { card in
                    CardView(card: card, gradient: gradient)
                        .onTapGesture {
                            self.viewModel.choose(card: card)
                    } .padding(5)
                }
                .padding()
                .foregroundColor(viewModel.theme.color)
                .shadow(radius: 10)
                .layoutPriority(2.0)
                
                // Show score
                showScore(score: viewModel.score)
                Spacer(minLength: 20)
            }
            .navigationBarTitle("Memorize Game", displayMode: .inline)
                .foregroundColor(.orange)
            .navigationBarItems(leading:
                Text("\(viewModel.theme.name)")
                    .foregroundColor(.orange)
                , trailing:
                Button(action: {self.viewModel.newGame()}){ Text("New") }
            )
        }
        
    }
}

// MARK: - Show score

struct showScore: View {
   // var title: String
    var score: Int
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    .padding()
    .layoutPriority(1.0)
    }
    private func body(for size: CGSize) -> some View {
        Text("Score: \(score)")
        .foregroundColor(.white)
        .frame(width: size.width  , height: 50 , alignment: .center)
        .background(Color.orange)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
    let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
      return  EmojiMemoryGameView(viewModel: game)
    }
}
