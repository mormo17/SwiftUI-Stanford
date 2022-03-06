//
//  ContentView.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SetGameViewModel
    typealias constants = Constants.ContentView
    var body: some View {
        NavigationView {
            AspectVGrid(items: viewModel.cards, aspectRatio: constants.aspectRatio) { card in
                CardView(card: card)
                    .padding(constants.padding)
                    .onTapGesture { viewModel.choose(card: card) }
            }.onAppear(perform: viewModel.startGame)
                .padding(.horizontal)
                .navigationTitle(constants.navigationTitle)
                .navigationBarItems(
                    leading: Button(constants.newGameButtonTitle) { viewModel.startGame() },
                    trailing: Button(constants.dealMoreCardsButtonTitle){ viewModel.dealMoreCards() }
                        .disabled(viewModel.hasMoreCards))
        }
        
        HStack{
            Button(action: { self.viewModel.hint() })
            { Text(constants.hintButtonTitle) }
            .disabled(viewModel.hintPossible)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
