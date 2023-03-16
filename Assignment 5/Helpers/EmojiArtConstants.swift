//
//  EmojiArtConstants.swift
//  Assignment 5
//
//  Created by Mariam Ormotsadze on 17.03.23.
//

import Foundation

struct EmojiArtConstants {
    struct Shared {
        static let emojiFontSize: CGFloat =  40
    }
    
    struct PalleteChooser {
        struct ImageName {
            static let palleteButton = "paintpalette"
            static let addButton = "plus"
            static let editButton = "pencil"
            static let deleteButton = "minus.circle"
            static let manageButton = "slider.vertical.3"
            static let goToButton = "text.insert"
        }
    }
    
    struct PalleteManager {
        static let title = "Manage Palettes"
    }
    
    struct PaletteEditor {
        struct Title {
            static let edit = "Edit "
            static let header = "Name"
            static let addEmojis = "Add Emojis"
            static let deleteEmoji = "Delete Emoji"
        }
        
        struct Dimensions {
            static let minWidth: CGFloat = 300
            static let minHeight: CGFloat = 300
            static let gridMinSize: CGFloat = 40
        }
        
    }
}
