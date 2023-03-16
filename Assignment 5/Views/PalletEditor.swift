//
//  PalletEditor.swift
//  Assignment 5
//
//  Created by Mariam Ormotsadze on 14.03.23.
//

import SwiftUI

struct PaletteEditor: View {
    private typealias Shared_Constants = EmojiArtConstants.Shared
    private typealias Titles = EmojiArtConstants.PaletteEditor.Title
    private typealias Dims = EmojiArtConstants.PaletteEditor.Dimensions
    
    @Binding var palette: Pallete
    
    var body: some View {
        Form {
            title
            addEmojis
            deleteEmojis
        }
        .navigationTitle(Titles.edit + palette.name)
        .frame(minWidth: Dims.minWidth, minHeight: Dims.minHeight)
    }
    
    var title: some View {
        Section(header: Text(Titles.header)) {
            TextField(Titles.header, text: $palette.name)
        }
    }
    
    @State private var addedEmoji = ""
    
    var addEmojis: some View {
        Section(header: Text(Titles.addEmojis)) {
            TextField("", text: $addedEmoji)
                .onChange(of: addedEmoji) { emoji in
                    add(emoji)
                }
        }
    }
    
    func add(_ emoji: String) {
        withAnimation {
            palette.emojis += emoji
                .removingDuplicateCharacters
        }
    }
    
    var deleteEmojis: some View {
        Section(header: Text(Titles.deleteEmoji)) {
            let emojis = palette.emojis.removingDuplicateCharacters.map { String($0) }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: Dims.gridMinSize))]) {
                ForEach(emojis, id: \.self) { emoji in
                    Text(emoji)
                        .onTapGesture {
                            withAnimation {
                                palette.emojis.removeAll(where: { String($0) == emoji })
                            }
                        }
                }
            }
            .font(.system(size: Shared_Constants.emojiFontSize))
        }
    }
}
