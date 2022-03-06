//
//  Card.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import SwiftUI

struct Card: Identifiable {
    private typealias Constants = SetConstants.Card
    var id: Int
    var numberOfFigures: Int
    let figures: Figures
    var state: Card.State
    var isDealt: Bool = false
    var isDiscarded: Bool = false
    
    struct Figures: Identifiable {
        let id: Int
        let figure: Card.Figure
        let color: Card.Color
        let shading: Card.Shading
        
        init(id: Int = 0,
             color: Card.Color,
             figure: Card.Figure,
             shading: Card.Shading
        ) {
            self.id = id
            self.color = color
            self.figure = figure
            self.shading = shading
        }
    }
    
    enum Color: CaseIterable {
        case red
        case blue
        case green
        
        var name: SwiftUI.Color {
            switch self {
            case .red:   return .red
            case .blue:  return .blue
            case .green: return .green
            }
        }
    }

    enum State: CaseIterable {
        case normal
        case isSelected
        case isMatched
        case misMatched
        
        var scaleEffect: Double {
            switch self {
            case .normal:     return Constants.normalScaleEffect
            case .isSelected: return Constants.selectedScaledEffect
            case .isMatched:  return Constants.matchedScaledEffect
            case .misMatched: return Constants.misMatchedScaledEffect
            }
        }
        
        var background: SwiftUI.Color {
            switch self {
            case .normal:     return .white
            case .isSelected: return .yellow
            case .isMatched:  return .green
            case .misMatched: return .red
            
            }
        }
        
        var border: SwiftUI.Color {
            switch self {
            case .normal:     return .gray
            case .isSelected: return .yellow
            case .isMatched:  return .green
            case .misMatched: return .red
            }
        }
    }

    enum Shading: CaseIterable {
        case empty
        case filled
        case stripped
    }

    enum Figure: CaseIterable {
        case oval
        case diamond
        case squiggle

        func path(in rect: CGRect) -> Path {
            switch self {
            case .oval:     return Oval().path(in: rect)
            case .diamond:  return Diamond().path(in: rect)
            case .squiggle: return Squiggle().path(in: rect)
            }
        }
    }
}
