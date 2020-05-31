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
        return VStack{
            // Tittle and score
            Spacer(minLength: 20)
            header(title: viewModel.theme.name, score: viewModel.score)
                
            Spacer(minLength: 20)
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
            
            // Button for new game
            footer(gameViewModel: viewModel)
            Spacer(minLength: 20)
        }
    }
}

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
    func body(for size: CGSize) -> some View {
        ZStack{
            
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius:10.0)
                        .stroke(lineWidth: 3)
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
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    .padding()
    .layoutPriority(1.0)
    }
    func body(for size: CGSize) -> some View {
        VStack {
            Text("Memorize Game")
                .font(.title)
            HStack {
                Text("Theme - \(title)")
                Spacer()
                Text("Score: \(score)")
            }
        .padding(5)
            .font(.body)
        }
        .foregroundColor(.white)
        .frame(width: size.width  , height: 80 , alignment: .center)
        .background(Color.orange)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        
    }
}

// MARK: - Footer

struct footer: View {
    var gameViewModel : EmojiMemoryGame
    var body: some View {
        GeometryReader { geometry in
                self.body(for: geometry.size)
            }
        .padding()
        .layoutPriority(1.0)
    }
    
    func body(for size: CGSize) -> some View {
        // Create button for new random theme game
        Button("New Game") {
            // Create new game
            self.gameViewModel.newGame()
        }
        .frame(width: size.width  , height: 30 , alignment: .center)
        .background(Color.orange)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .layoutPriority(1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
