//
//  Assignment_5App.swift
//  Assignment 5
//
//  Created by Mariam Ormotsadze on 06.03.23.
//

import SwiftUI

@main
struct Assignment_5App: App {
    let document = EmojiArtDocument()
    @StateObject var emojiManager = EmojiManager()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
                .environmentObject(emojiManager)
        }
    }
}
