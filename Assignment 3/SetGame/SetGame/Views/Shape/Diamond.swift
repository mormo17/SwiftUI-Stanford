//
//  Diamond.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let right   = CGPoint(x:  rect.maxX, y: rect.midY)
        let left    = CGPoint(x:  rect.minX, y: rect.midY)
        let top     = CGPoint(x:  rect.midX, y: rect.minX)
        let bottom  = CGPoint(x:  rect.midX, y: rect.maxY)
        
        var path = Path()
        path.move(to: left)
        path.addLine(to: top)
        path.addLine(to: right)
        path.addLine(to: bottom)
        path.addLine(to: left)
        
        return path
    }
}
