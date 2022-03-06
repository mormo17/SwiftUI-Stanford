//
//  CardView.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import SwiftUI

struct CardView: View {
    private typealias Constants = SetConstants.CardView
    var card: Card
    var isFaceUp: Bool
    
    var body: some View {
        let cardShapeItemsData = (0..<card.numberOfFigures).map {
            Card.Figures.init(
                id: $0,
                color: card.figures.color,
                figure: card.figures.figure,
                shading: card.figures.shading)
        }
        
        ZStack {
            let rect = RoundedRectangle(cornerRadius: Constants.rectangleCornerRadius)
            
            card.state == .normal
            ? rect.fill(card.state.background).opacity(Constants.defaultOpacity)
            : rect.fill(card.state.background).opacity(Constants.opacity)
            rect.stroke(card.state.border)
            
            if card.isDiscarded {
                rect.fill(.white)
                rect.fill(.gray).opacity(Constants.opacity)
                rect.stroke(.gray)
            }
            
            if isFaceUp { // card on table or in discarded deck pile
                VStack {
                    ForEach(cardShapeItemsData) {
                        FigureView(figures: $0)
                    }
                }.padding()
            } else { // deck
                rect.foregroundColor(Constants.color)
            }
        }
        .scaleEffect(card.isDiscarded ? 1 : card.state.scaleEffect)
    }
    
    struct FigureView: View {
        let figures: Card.Figures
        
        var body: some View {
            GeometryReader { geometry in
                let figure = figures.figure.path(in: geometry.frame(in: .local))

                switch figures.shading {
                case .empty:
                    figure.stroke(figures.color.name)
                case .stripped:
                    figure.fill(figures.color.name)
                         .opacity(Constants.strippedFigureOpacity)
                    figure.stroke(figures.color.name)
                case .filled:
                    figure.fill(figures.color.name)
                }
            }
        }
    }
}
