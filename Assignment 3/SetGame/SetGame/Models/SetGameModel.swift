//
//  SetGameModel.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import Foundation

struct SetGameModel {
    private typealias constants = Constants.SetGameModel
    private(set) var deck: [Card]
    private var cardIndex = 0
    
    init() {
        deck = []
        var index = 0
        for numberOfShapes in 1...constants.numberOfFigures {
            for color in CardColor.allCases {
                for shape in CardShape.allCases {
                    for shading in CardShading.allCases {
                        deck.append(Card(id: index,
                                         numberOfFigures: numberOfShapes,
                                         figure: .init(color: color, shape: shape, shading: shading),
                                         state: .normal))
                        index += 1
                    }
                }
            }
        }
        deck.shuffle()
    }
    
    var hasMoreCards: Bool { cardIndex < deck.count }
    
    var hasCardsRemaining : Bool { cardIndex < deck.count }
    
    var selectedCards: [Card] {
        deck.filter { card in
            card.state == .isSelected ||
            (card.state == .wasMatched && !card.wasDiscarded) ||
            (card.state == .misMatched && !card.wasDiscarded)
        }
    }
    
    func getAvailableCards() -> [Card] { deck.filter { card in card.wasDealt && !card.wasDiscarded } }
    
    mutating func dealCards(_ number: Int) {
        for _ in 0...number-1 {
            if(cardIndex < deck.count){
                deck[cardIndex].wasDealt = true
                cardIndex += 1
            }
        }
    }
    
    func cardsMakeSet(selected: [Card]) -> Bool {
        Set(selected.map    { $0.figure.color   } ).count == constants.numberToMakeSet
        && Set(selected.map { $0.figure.shape   } ).count == constants.numberToMakeSet
        && Set(selected.map { $0.figure.shading } ).count == constants.numberToMakeSet
        && Set(selected.map { $0.numberOfFigures} ).count == constants.numberToMakeSet
    }
    
    mutating func deselectAll() { changeState(state: .normal) }
    
    mutating func choose(card: Card) {
        if(selectedCards.count < constants.numberToMakeSet){
            if let selectedIndex = deck.find(matching: card){
                selectCard(selectedIndex: selectedIndex)
                if(selectedCards.count == constants.numberToMakeSet) { check() }
            }
        } else {
            if(hasCardsRemaining){ replaceMatchedCards() }
            deselectAll()
            if let selectedIndex = deck.find(matching: card) { selectCard(selectedIndex: selectedIndex) }
        }
    }
    
    mutating func replaceMatchedCards(){
        selectedCards.forEach{ card in
            if(card.state == .wasMatched){
                if let index = deck.find(matching: card){
                    deck[index].wasDiscarded = true
                    if(cardIndex < deck.count){
                        deck[cardIndex].wasDealt = true
                        cardIndex = cardIndex + 1
                    }
                }
            }
        }
    }
    
    private mutating func selectCard(selectedIndex: Int) {
        if(deck[selectedIndex].state == .isSelected) { deck[selectedIndex].state = .normal }
        else { deck[selectedIndex].state = .isSelected }
    }
    
    private mutating func check() {
        if(cardsMakeSet(selected: self.selectedCards)) { changeState(state: .wasMatched) }
        else { changeState(state: .misMatched) }
    }
    
    private mutating func changeState(state: CardState) {
        selectedCards.forEach { card in
            if let index = deck.find(matching: card) { deck[index].state = state }
        }
    }
}

extension Array where Element: Identifiable{
    func find(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id { return index }
        }
        return nil
    }
}

