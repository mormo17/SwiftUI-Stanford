//
//  EmojiManager.swift
//  Assignment 5
//
//  Created by Mariam Ormotsadze on 14.03.23.
//

import Foundation

struct Pallete: Identifiable {
    var name: String
    var emojis: String
    var id: Int
    
    fileprivate init(name: String, emojis: String, id: Int) {
        self.name = name
        self.emojis = emojis
        self.id = id
    }
}

class EmojiManager: ObservableObject {
    @Published var palettes: [Pallete] = []
    
    private var uid = 0
    
    init() {
        PalleteNames.allCases.forEach { pallete in
            insertPallete(name: pallete.name, emojis: pallete.emojis)
        }
    }
    
    func deletePallete(at index: Int) -> Int {
        if palettes.count > 1, palettes.indices.contains(index) {
            palettes.remove(at: index)
        }
        return index % palettes.count
    }
    
    func insertPallete(name: String, emojis: String) {
        palettes.append(Pallete(name: name, emojis: emojis, id: uid))
        uid += 1
    }
}
