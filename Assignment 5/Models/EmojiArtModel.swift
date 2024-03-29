//
//  EmojiArtModel.swift
//  Assignment 5
//
//  Created by Mariam Ormotsadze on 06.03.23.
//

import Foundation

struct EmojiArtModel {
    var background = Background.blank
    var emojis = [Emoji]()
    
    struct Emoji: Identifiable, Hashable {
        let text: String
        var x: Int // offset from the center
        var y: Int // offset from the center
        var size: Int
        var id: Int
        var isSelected: Bool
        
        fileprivate init(text: String, x: Int, y: Int, size: Int, id: Int, isSelected: Bool = false) {
            self.text = text
            self.x = x
            self.y = y
            self.size = size
            self.id = id
            self.isSelected = isSelected
        }
    }
    
    init() { }
    
    private var uniqueEmojiId = 0
    mutating func addEmoji(_ text: String, at location: (x: Int, y: Int), size: Int) {
        uniqueEmojiId += 1
        emojis.append(Emoji(text: text, x: location.x, y: location.y, size: size, id: uniqueEmojiId))
    }
}
