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
          emojis: ["π²", "π" ,"π" , "π" , "π", "π", "π", "π", "π", "βοΈ", "π", "β΅οΈ", "πΈ", "πΆ", "π", "π", "πΊ", "π ", "π΅", "π", "π", "π", "π»", "π"],
          foregroundColor: .red),
    Theme(name: "Animals",
          emojis: ["π₯", "π¦", "π¦", "π¦", "π", "π’", "π", "π¦", "π¦", "π¦", "π¦­", "π", "π«", "π¦", "π", "π¦«", "π¦¦"],
          foregroundColor: .yellow),
    Theme(name: "Food",
          emojis: ["π", "π", "π", "π₯ͺ", "π", "π₯©", "π₯", "π§", "π³", "π₯", "π", "π₯«", "π£", "π₯", "π«", "πΏ", "π©", "πͺ"],
          foregroundColor: .purple),
    Theme(name: "Sport",
          emojis: ["β½οΈ", "π", "π", "βΎοΈ", "πΎ", "π", "π", "π₯", "π±", "π", "πΈ", "π"],
          foregroundColor: .mint),
    Theme(name: "Technology",
          emojis: ["βοΈ", "π±", "π»", "β¨οΈ", "π₯", "π¨", "π±", "π·", "π₯", "π½", "βοΈ", "πΊ", "π", "β°"],
          foregroundColor: .gray),
    Theme(name: "Weather",
          emojis: ["π€", "βοΈ", "π¦", "β", "π©", "βοΈ", "βοΈ", "π¨", "πͺ", "π"],
          foregroundColor: .indigo),
    
]
