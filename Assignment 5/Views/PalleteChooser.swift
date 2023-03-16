//
//  PalleteChooser.swift
//  Assignment 5
//
//  Created by Mariam Ormotsadze on 14.03.23.
//

import SwiftUI

struct PaletteChooser: View {
    private typealias Shared_Constants = EmojiArtConstants.Shared
    internal typealias Image_Names = EmojiArtConstants.PalleteChooser.ImageName
    
    @EnvironmentObject var emojiManager: EmojiManager
    
    @State private var chosenPaletteIndex = 0
    @State private var managing = false
    @State private var paletteToEdit: Pallete?
    
    
    var body: some View {
        HStack {
            palleteButton
            ScrollingEmojisView(emojis: emojiManager.palettes[chosenPaletteIndex].emojis)
                .font(.system(size: CGFloat(Shared_Constants.emojiFontSize)))
        }
        .popover(item: $paletteToEdit) { palette in
            let index = emojiManager.palettes.firstIndex { $0.id == palette.id }!
            PaletteEditor(palette: $emojiManager.palettes[index])
        }
        .sheet(isPresented: $managing) {
            PaletteManager()
        }
    }
    
    
    var palleteButton: some View {
        Button {
            withAnimation {
                chosenPaletteIndex = (chosenPaletteIndex + 1) % emojiManager.palettes.count
            }
        } label: {
            Image(systemName: Image_Names.palleteButton)
        }
        .font(.system(size: CGFloat(Shared_Constants.emojiFontSize)))
        .contextMenu { contextMenu }
    }
    
    @ViewBuilder
    var contextMenu: some View {
        Button {
            emojiManager.insertPallete(name: "New", emojis: "")
            chosenPaletteIndex = emojiManager.palettes.count - 1
            paletteToEdit = emojiManager.palettes[chosenPaletteIndex]
        } label: {
            Label(MenuButton.new.title, systemImage: MenuButton.new.imageName)
        }
        
        Button {
            paletteToEdit = emojiManager.palettes[chosenPaletteIndex]
        } label: {
            Label(MenuButton.edit.title, systemImage: MenuButton.edit.imageName)
        }
       
        Button {
            chosenPaletteIndex = emojiManager.deletePallete(at: chosenPaletteIndex)
        } label: {
            Label(MenuButton.delete.title, systemImage: MenuButton.delete.imageName)
        }
        
        Button {
            managing = true
        } label: {
            Label(MenuButton.manage.title, systemImage: MenuButton.new.imageName)
        }
        
        palleteChooserMenu
    }
    
    var palleteChooserMenu: some View {
        Menu {
            ForEach(emojiManager.palettes) { pallete in
                Button {
                    if let index = emojiManager.palettes.index(matching: pallete) {
                        chosenPaletteIndex = index
                    }
                } label: {
                    Text(pallete.name)
                }
            }
        } label: {
            Label(MenuButton.goTo.title, systemImage: MenuButton.goTo.imageName)
        }
    }
}
