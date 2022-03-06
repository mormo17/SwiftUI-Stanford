//
//  Card.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    var id: Int
    var numberOfFigures: Int
    let figure: Figure
    var state: CardState
    var wasDealt: Bool = false
    var wasDiscarded: Bool = false
    
    struct Figure: Identifiable {
        let id: Int
        let shape: CardShape
        let color: CardColor
        let shading: CardShading
        
        init(id: Int = 0,
             color: CardColor,
             shape: CardShape,
             shading: CardShading
        ) {
            self.id = id
            self.color = color
            self.shape = shape
            self.shading = shading
        }
    }
}


enum CardColor: CaseIterable {
    case red
    case green
    case blue
}

extension CardColor {
    var name: Color {
        switch self {
        case .red: return .red
        case .green: return .green
        case .blue: return .blue
        }
    }
}

enum CardState: CaseIterable {
    case normal
    case isSelected
    case wasMatched
    case misMatched
}

enum CardShading: CaseIterable {
    case empty
    case stripped
    case filled
}

enum CardShape: CaseIterable {
    case circle
    case diamond
    case squiggle
}

extension CardState {
    var color: Color {
        switch self {
        case .normal: return .gray
        case .isSelected: return .yellow
        case .wasMatched: return .green
        case .misMatched: return .red
        }
    }
}


extension CardShape {
    func path(in rect: CGRect) -> Path {
        switch self {
        case .circle: return Circle().path(in: rect)
        case .diamond: return Diamond().path(in: rect)
        case .squiggle: return Squiggle().path(in: rect)
        }
    }
}
