//
//  ContentView.swift
//  Memorize
//
//  Created by Mariam Ormotsadze on 12/19/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            HStack{
                Text(viewModel.theme.name).font(.title)
                    .foregroundColor(viewModel.theme.foregroundColor)
                Spacer()
                Text("Score: \(viewModel.score)").font(.title)
                    .foregroundColor(.black)
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 55))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.theme.foregroundColor)
            
            HStack {
                Button("New Game"){
                    viewModel.startNewGame()
                }.foregroundColor(.black)
                    .font(.title)
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding()
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if(card.isMatched){
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
