//
//  ScrollingEmojisView.swift
//  Assignment 5
//
//  Created by Mariam Ormotsadze on 14.03.23.
//

import SwiftUI

struct ScrollingEmojisView: View {
    let emojis: String

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(emojis.map {String($0) }, id: \.self) { emoji in
                    Text(emoji)
                        .onDrag { NSItemProvider(object: emoji as NSString) }
                }
            }
        }
    }
}
