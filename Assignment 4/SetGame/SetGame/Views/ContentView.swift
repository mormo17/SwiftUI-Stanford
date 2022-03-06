//
//  ContentView.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import SwiftUI

struct ContentView: View {
    typealias Constants = SetConstants.ContentView
    @ObservedObject var game: SetGameViewModel
    @Namespace private var dealingNamespace
    @Namespace private var undealingNamespace
   
    var body: some View {
        NavigationView {
            VStack {
                gameBody
                bottomView
            }
            .padding()
            .navigationTitle(Constants.navigationTitle)
            .navigationBarItems(
                leading: Button(Constants.newGameButtonTitle) {
                    withAnimation {
                        game.newGame()
                    }
                },
                trailing: Button(Constants.hintButtonTitle){
                    withAnimation{
                        game.check()
                        game.hint()
                    }
                    
                }.disabled(game.hintPossible))
        }
        
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cardsOnTable, aspectRatio: Constants.aspectRatio) { card in
            CardView(card: card, isFaceUp: true)
                .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                .matchedGeometryEffect(id: card.id, in: undealingNamespace)
                .padding(Constants.padding)
                .zIndex(zIndex(of: card))
                .onTapGesture { choose(card) }
        }
    }
    
    var bottomView: some View {
        HStack {
            deckBody
            Spacer()
            discardedDeckBody
        }
    }
    
    var discardedDeckBody: some View {
        ZStack {
            ForEach(game.discardedCards) { card in
                CardView(card: card, isFaceUp: true)
                    .matchedGeometryEffect(id: card.id, in: undealingNamespace)
                    .zIndex(zIndex(of: card))
            }
        }
        .frame(width: Constants.undealtWidth, height: Constants.undealtHeight)
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(game.cardsInDeck) { card in
                CardView(card: card, isFaceUp: false)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .zIndex(zIndex(of: card))
            }
        }
        .frame(width: Constants.undealtWidth, height: Constants.undealtHeight)
        .onTapGesture {
            game.cardsOnTable.isEmpty ? dealInitialCards() : dealCards()
        }
    }
    
    // MARK: - private functions
    private func dealAnimation(for card: Card) -> Animation {
        var delay = 0.0
        if let index = game.cardsInDeck.firstIndex(where: {$0.id == card.id }) {
            delay = Double(index) * (Constants.totalDealDuration / Double(game.cardsInDeck.count))
        }
        
        return Animation.easeInOut(duration: Constants.dealDuration).delay(delay)
    }
    
    // Deals initial number of cards
    private func dealInitialCards() {
        withAnimation {
            game.startGame()
        }
    }
    
    // Deals 3 more cards
    private func dealCards() {
        for _ in 1...Constants.numberOfCardsToDeal {
            if let card = game.getNextCard() {
                withAnimation(dealAnimation(for: card)){
                    game.check()
                    game.deal()
                }
            }
        }
    }
    
    private func choose(_ card: Card) {
        withAnimation {
            game.choose(card: card)
        }
    }
    
    private func zIndex(of card: Card) -> Double {
        -Double(game.cardsInDeck.firstIndex(where: { $0.id == card.id }) ?? 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(game: .init())
    }
}
