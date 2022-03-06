//
//  Constants.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/27/22.
//

import SwiftUI

struct SetConstants {
    struct SetGameModel {
        static let numberToMakeSet = 3
        static let numberOfFigures = 3
        static let initialNumberOfCards = 12
        static let hintNumbersToShow = numberToMakeSet - 2
    }
    
    struct Card {
        static let normalScaleEffect:      Double = 1
        static let selectedScaledEffect:   Double = 1.04
        static let matchedScaledEffect:    Double = 1.041
        static let misMatchedScaledEffect: Double = 0.96
    }
    
    struct CardView {
        static let rectangleCornerRadius: CGFloat = 15
        static let strippedFigureOpacity: Double = 0.4
        static let color: Color = .cyan
        static let opacity: Double = 0.2
        static let defaultOpacity: Double = 0.9
        
    }
    
    struct ContentView {
        static let aspectRatio: CGFloat = 2/3
        static let padding: CGFloat = 5
        static let navigationTitle: String = "Set Game"
        static let newGameButtonTitle: String = "New Game"
        static let hintButtonTitle: String = "Hint"
    
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 2
        static let undealtHeight: CGFloat = 90
        static let undealtWidth = undealtHeight * aspectRatio
        static let numberOfCardsToDeal = 3
    }
    
    struct AspectVGrid {
        static let maximumWidthToFit: CGFloat = 60
    }
    
}
