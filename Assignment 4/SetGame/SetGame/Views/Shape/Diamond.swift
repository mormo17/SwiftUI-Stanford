//
//  Diamond.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let height = min(rect.height, rect.width/2) / CGFloat(2.0)
        let width = height * 2
        
        let start       = CGPoint(x: rect.midX, y: rect.midY - height)
        let bottomRight = CGPoint(x: rect.midX + width, y: rect.midY)
        let topRight    = CGPoint(x: rect.midX,         y: rect.midY + height)
        let bottomLeft  = CGPoint(x: rect.midX - width, y: rect.midY)
        let topLeft     = CGPoint(x: rect.midX,         y: rect.midY - height)
       
        var path = Path()
        path.move(to: start)
        path.addLine(to: bottomRight)
        path.addLine(to: topRight)
        path.addLine(to: bottomLeft)
        path.addLine(to: topLeft)

        return path
    }
}
