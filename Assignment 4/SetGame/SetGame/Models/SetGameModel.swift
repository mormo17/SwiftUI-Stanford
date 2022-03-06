//
//  SetGameModel.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import Foundation

struct SetGameModel {
    private typealias Constants = SetConstants.SetGameModel
    private(set) var deck: [Card]
    private var cardIndex = 0
    
    init() {
        deck = []
        var index = 0
        for numberOfShapes in 1...Constants.numberOfFigures {
            for color in Card.Color.allCases {
                for figure in Card.Figure.allCases {
                    for shading in Card.Shading.allCases {
                        deck.append(Card(id: index,
                                         numberOfFigures: numberOfShapes,
                                         figures: .init(color: color, figure: figure, shading: shading),
                                         state: .normal))
                        index += 1
                    }
                }
            }
        }
        
        deck.shuffle()
    }
    
    // MARK: - public variables/functions
    var selectedCards: [Card] {
        deck.filter { card in
            card.state == .isSelected
            || (card.state == .isMatched  && !card.isDiscarded)
            || (card.state == .misMatched && !card.isDiscarded)
        }
    }
    
    func getCardsInDeck() -> [Card] {
        deck.filter({ !$0.isDealt })
    }
    
    func getCardsOnTable() -> [Card] {
        deck.filter({ $0.isDealt && !$0.isDiscarded})
    }
    
    func getDiscarded() -> [Card] {
        deck.filter({ $0.isDiscarded })
    }
    
    func getNextCard() -> Card? {
        if cardIndex < deck.count {
            return deck[cardIndex]
        }
        return nil
    }
    
    func cardsMakeSet(selected: [Card]) -> Bool {
        Set(selected.map    { $0.figures.color   } ).count == Constants.numberToMakeSet
        && Set(selected.map { $0.figures.figure   } ).count == Constants.numberToMakeSet
        && Set(selected.map { $0.figures.shading } ).count == Constants.numberToMakeSet
        && Set(selected.map { $0.numberOfFigures} ).count == Constants.numberToMakeSet
    }
    
    // MARK: - mutating functions
    mutating func deselectAll() {
        changeState(state: .normal)
    }
    
    mutating func dealCards(_ number: Int) {
        for _ in 0...number-1 {
            deal()
        }
    }
    
    mutating func deal() {
        if cardIndex < deck.count {
            deck[cardIndex].isDealt = true
            cardIndex += 1
        }
    }
    
    mutating func choose(card: Card) {
        if selectedCards.count < Constants.numberToMakeSet {
            if let selectedIndex = deck.find(matching: card) {
                selectCard(selectedIndex: selectedIndex)
                if selectedCards.count == Constants.numberToMakeSet {
                    check()
                }
            }
        } else {
            deselectAndDiscard()
            if let selectedIndex = deck.find(matching: card) {
                selectCard(selectedIndex: selectedIndex)
            }
        }
    }
    
    mutating func discardMatched() {
        selectedCards.forEach { card in
            if card.state == .isMatched {
                if let index = deck.find(matching: card) {
                    deck[index].isDiscarded = true
                }
            }
        }
    }
    
    mutating func deselectAndDiscard() {
        discardMatched()
        deselectAll()
    }
    
    // MARK: - private functions
    private mutating func selectCard(selectedIndex: Int) {
        if deck[selectedIndex].state == .isSelected {
            deck[selectedIndex].state = .normal
        } else {
            deck[selectedIndex].state = .isSelected
        }
    }
    
    private mutating func check() {
        cardsMakeSet(selected: self.selectedCards)
        ? changeState(state: .isMatched)
        : changeState(state: .misMatched)
    }
    
    private mutating func changeState(state: Card.State) {
        selectedCards.forEach {
            if let index = deck.find(matching: $0) { deck[index].state = state }
        }
    }
}

extension Array where Element: Identifiable{
    func find(matching: Element) -> Int? {
        return self.firstIndex(where: { $0.id == matching.id })
    }
}

