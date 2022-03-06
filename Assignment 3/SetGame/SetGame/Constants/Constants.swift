//
//  Constants.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/27/22.
//

import SwiftUI

struct Constants {
    struct SetGameModel {
        static let numberToMakeSet = 3
        static let numberOfFigures = 3
        static let initalNumberOfCards = 12
        static let numberOfCardsToDeal = 3
        static let hintNumbersToShow = numberToMakeSet - 2
    }
   
    
    struct CardView {
        static let rectangleCornerRadius: CGFloat = 15
        static let strippedFigureOpacity: Double = 0.4
    }
    
    struct ContentView {
        static let aspectRatio: CGFloat = 2/3
        static let padding: CGFloat = 5
        static let navigationTitle: String = "Set Game"
        static let newGameButtonTitle: String = "New Game"
        static let dealMoreCardsButtonTitle: String = "Deal More Cards"
        static let hintButtonTitle: String = "Hint"
    }
    
    struct AspectVGrid {
        static let maximumWidthToFit: CGFloat = 60
    }
    
}
