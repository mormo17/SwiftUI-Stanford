//
//  Theme.swift
//  Memorize
//
//  Created by Mariam Ormotsadze on 1/30/22.
//

import Foundation
import SwiftUI

struct Theme {
    var name: String
    var emojis: [String]
    var numberOfPairsOfCards: Int?
    var foregroundColor: Color
}

let themes: [Theme] =
[
    Theme(name: "Vehicles",
          emojis: ["🚲", "🚂" ,"🚁" , "🚜" , "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"],
          foregroundColor: .red),
    Theme(name: "Animals",
          emojis: ["🐥", "🦉", "🦇", "🦄", "🐝", "🐢", "🐙", "🦕", "🦑", "🦞", "🦭", "🐊", "🐫", "🦒", "🐄", "🦫", "🦦"],
          foregroundColor: .yellow),
    Theme(name: "Food",
          emojis: ["🍔", "🍟", "🍕", "🥪", "🍗", "🥩", "🥓", "🧇", "🍳", "🥐", "🍝", "🥫", "🍣", "🥟", "🍫", "🍿", "🍩", "🍪"],
          foregroundColor: .purple),
    Theme(name: "Sport",
          emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏉", "🥏", "🎱", "🏓", "🏸", "🏑"],
          foregroundColor: .mint),
    Theme(name: "Technology",
          emojis: ["⌚️", "📱", "💻", "⌨️", "🖥", "🖨", "🖱", "📷", "🎥", "📽", "☎️", "📺", "🎙", "⏰"],
          foregroundColor: .gray),
    Theme(name: "Weather",
          emojis: ["🌤", "⛅️", "🌦", "⛈", "🌩", "❄️", "☔️", "💨", "🌪", "🌈"],
          foregroundColor: .indigo),
    
]
