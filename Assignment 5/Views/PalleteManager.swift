//
//  PalleteManager.swift
//  Assignment 5
//
//  Created by Mariam Ormotsadze on 14.03.23.
//

import SwiftUI

struct PaletteManager: View {
    private typealias Constants = EmojiArtConstants.PalleteManager
    
    @EnvironmentObject var emojiManager: EmojiManager
    
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            List {
                ForEach(emojiManager.palettes) { palette in
                    let index = emojiManager.palettes.firstIndex { $0.id == palette.id }!
                    NavigationLink(destination: PaletteEditor(palette: $emojiManager.palettes[index])) {
                        VStack(alignment: .leading) {
                            Text(palette.name)
                            Text(palette.emojis)
                        }
                        .gesture(editMode == .active ? tap : nil)
                    }
                }
                .onDelete { indexSet in
                    emojiManager.palettes.remove(atOffsets: indexSet)
                }
                .onMove { from, to in
                    emojiManager.palettes.move(fromOffsets: from, toOffset: to)
                }
            }
            .navigationTitle(Constants.title)
            .toolbar {
                ToolbarItem { EditButton() }
            }
            .environment(\.editMode, $editMode)
        }
    }
    
    var tap: some Gesture {
        TapGesture().onEnded { }
    }
}
