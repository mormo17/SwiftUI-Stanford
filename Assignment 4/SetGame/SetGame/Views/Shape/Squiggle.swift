//
//  Squiggle.swift
//  SetGame
//
//  Created by Mariam Ormotsadze on 2/20/22.
//

import SwiftUI

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        let height = min(rect.height, rect.width/2)
        let width = height * 2.0
        
        var path = Path()
        path.addRect(.init(
            x: rect.midX - width/2,
            y: rect.midY - height/2,
            width: width,
            height: height))
        return path
    }
}
