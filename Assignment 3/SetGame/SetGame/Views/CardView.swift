//
//  CardView.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import Foundation
import SwiftUI

struct CardView: View {
    private typealias constants = Constants.CardView
    var card: Card
    
    var body: some View {
        let cardShapeItemsData = (0..<card.numberOfFigures).map { id in
            Card.Figure.init(
                id: id,
                color: card.figure.color,
                shape: card.figure.shape,
                shading: card.figure.shading)
        }
        
        ZStack {
            VStack {
                ForEach(cardShapeItemsData) { shapeItem in
                    FigureView(figure: shapeItem)
                }
            }.padding()
            
            let rect = RoundedRectangle(cornerRadius: constants.rectangleCornerRadius)
            rect.stroke(card.state.color)
        }
    }
    
    struct FigureView: View {
        let figure: Card.Figure
        
        var body: some View {
            GeometryReader { geometry in
                let shape = figure.shape.path(in: geometry.frame(in: .local))

                switch figure.shading {
                case .empty:
                    shape.stroke(figure.color.name)
                case .stripped:
                    shape.fill(figure.color.name)
                         .opacity(constants.strippedFigureOpacity)
                    shape.stroke(figure.color.name)
                case .filled:
                    shape.fill(figure.color.name)
                }
            }
        }
    }
}
