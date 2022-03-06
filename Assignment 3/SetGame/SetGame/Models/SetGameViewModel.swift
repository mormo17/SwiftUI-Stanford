//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import Foundation

class SetGameViewModel: ObservableObject {
    @Published private var model: SetGameModel = SetGameModel()
    private typealias constants = Constants.SetGameModel
    
    var cards: [Card] { model.getAvailableCards() }
    
    var hasMoreCards: Bool { !model.hasMoreCards }
    
    var hintPossible : Bool {
        let matchingTriple = cards.firstMatchingTriple(matchBy: {(_ selected) in
            return model.cardsMakeSet(selected: selected)
        })
        
        return matchingTriple?.count != constants.numberToMakeSet
    }
    
    func startGame() {
        model = SetGameModel()
        model.dealCards(constants.initalNumberOfCards)
    }
    
    func dealMoreCards() { model.dealCards(constants.numberOfCardsToDeal) }
    
    func choose(card: Card) { model.choose(card: card) }
    
    func hint() {
        if let matchingTriplets = cards.firstMatchingTriple(matchBy: {(_ selected) in
            return model.cardsMakeSet(selected: selected)
        }){
            model.deselectAll()
            for i in 0...constants.hintNumbersToShow { choose(card: matchingTriplets[i]) }
        }
    }
}

extension Array where Element: Identifiable{
    func firstMatchingTriple(matchBy: (Array<Element>) -> Bool) -> Array<Element>?{
        outerLoop: for firstIndex in 0..<self.count{
            let firstElement: Element = self[firstIndex]
            for secondIndex in firstIndex+1..<self.count{
                let secondElement = self[secondIndex]
                for thirdIndex in secondIndex+1..<self.count{
                    let possibleMatch = [firstElement, secondElement, self[thirdIndex]]
                    if(matchBy(possibleMatch)){ return possibleMatch }
                }
            }
        }
        return nil
    }
}

