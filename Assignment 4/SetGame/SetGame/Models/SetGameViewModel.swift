//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import Foundation

class SetGameViewModel: ObservableObject {
    private typealias Constants = SetConstants.SetGameModel
    @Published private var model: SetGameModel = SetGameModel()
    
    init() {
        model = SetGameModel()
    }
    
    // MARK: - variables
    var cardsInDeck: [Card] { model.getCardsInDeck() }
    
    var cardsOnTable: [Card] { model.getCardsOnTable() }
    
    var discardedCards: [Card] { model.getDiscarded() }
    
    var hintPossible : Bool {
        let matchingTriple = cardsOnTable.firstMatchingTriple(matchBy: { model.cardsMakeSet(selected: $0) })
        
        return matchingTriple?.count != Constants.numberToMakeSet
    }
    
    // MARK: - functions
    func newGame() {
        model = SetGameModel()
    }
    
    func startGame() {
        newGame()
        model.dealCards(Constants.initialNumberOfCards)
    }
    
    func deal() {
        model.deal()
    }
    
    func getNextCard() -> Card? {
        model.getNextCard()
    }
    
    func choose(card: Card) {
        model.choose(card: card)
    }
    
    func check() {
        model.deselectAndDiscard()
    }
    
    func hint() {
        if let matchingTriplets = cardsOnTable.firstMatchingTriple(matchBy: { model.cardsMakeSet(selected: $0) }) {
            model.deselectAll()
            for i in 0...Constants.hintNumbersToShow { choose(card: matchingTriplets[i]) }
        }
    }
}

extension Array where Element: Identifiable{
    func firstMatchingTriple(matchBy: (Array<Element>) -> Bool) -> Array<Element>?{
        outerLoop: for firstIndex in 0..<count {
            let firstElement: Element = self[firstIndex]
            for secondIndex in firstIndex+1..<count {
                let secondElement = self[secondIndex]
                for thirdIndex in secondIndex+1..<count {
                    let thirdElement = self[thirdIndex]
                    let possibleMatch = [firstElement, secondElement, thirdElement]
                    if matchBy(possibleMatch) { return possibleMatch }
                }
            }
        }
        return nil
    }
}

