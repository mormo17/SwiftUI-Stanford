//
//  EmojiManager+PalleteNames.swift
//  Assignment 5
//
//  Created by Mariam Ormotsadze on 17.03.23.
//

import Foundation

extension EmojiManager {
    enum PalleteNames: String, CaseIterable {
        case faces = "Faces"
        case covid = "COVID"
        case weather = "Weather"
        case flora = "Flora"
        case animalFaces = "Animal Faces"
        case animals = "Animals"
        case music = "Music"
        case sport = "Sport"
        
        var emojis: String {
            switch self {
            case .faces:
                return "😀😃😄😁😆😅😂🤣🥲🥹☺️😊😇🙂🙃😉😌😍🥰😘😗😙😚😋😛😝😜🤪🤨🧐🤓😎🥸🤩🥳😏😒😞😔😟😕🙁☹️😣😖😫😩🥺😢😭😮‍💨😤😠😡🤬🤯😳🥵🥶😱😨😰😥😓🫣🤗🫡🤔🫢🤭🤫🤥😶😶‍🌫️😐😑😬🫠🙄😯😦😧😮😲🥱😴🤤😪😵😵‍💫🫥🤐🥴🤢🤮🤧😷🤒🤕🤑🤠😈👿🤡"
            case .covid:
                return "🧼🧪🌡🔬🧫🏨🦠🏥🧽🩺💊🚑😷🤧😷🧑‍⚕️🧑‍🔬"
            case .weather:
                return "🌪🌈☀️🌤⛅️🌥☁️🌦🌧⛈🌩🌨❄️☃️⛄️🌬💨💧💦🫧☔️☂️"
            case .flora:
                return "🌵🌲🌳🌴🪵🌱🌿☘️🍀🎍🪴🎋🍃🍂🍁🍄🌾💐🌷🪷🌹🥀🌺🌸🌼🌻"
            case .animalFaces:
                return "🐶🐱🐭🐹🐰🦊🐻🐼🐻‍❄️🐨🐯🦁🐮🐷🐽🐸🐵🙈🙉🙊🐔🐧🐦🐤🐺🐗🐴🦄🐲"
            case .animals:
                return "🐢🐍🦎🦖🦕🐙🦑🦐🦞🦀🪸🐡🐠🐟🐬🐳🐋🦈🐊🐅🐆🦓🦍🦧🦣🐘🦛🦏🐪🐫🦒🦘🦬🐃🐂🐄🐎🐖🐏🐑🦙🐐🦌🐕🐩🦮🐕‍🦺🐈🐈‍⬛🐓🦃🦤🦚🦜🦢🦩🕊🐇🦝🦨🦡🦫🦦🦥🐁🐀🐿🦔🐉"
            case .music:
                return "🔈🔇🔉🔊🎤🎧🎼🎹🥁🪘🎷🎺🪗🎸🪕🎻"
            case .sport:
                return "⚽️🏀🏈⚾️🥎🎾🏐🏉🥏🎱🪀🏓🏸🏒🏑🥍🏏🪃🥅⛳️🪁🏹🎣🤿🥊🥋🎽🛹🛼🛷⛸🥌🎿⛷🏂🪂🏋️‍♀️🏋️🏋️‍♂️🤼‍♀️🤼🤼‍♂️🤸‍♀️🤸🤸‍♂️⛹️‍♀️⛹️⛹️‍♂️🤺🤾‍♀️🤾🤾‍♂️🏌️‍♀️🏌️🏌️‍♂️🏇🧘‍♀️🧘🧘‍♂️🏄‍♀️🏄🏄‍♂️🏊‍♀️🏊🏊‍♂️🤽‍♀️🤽🤽‍♂️🚣‍♀️🚣🚣‍♂️🧗‍♀️🧗🧗‍♂️🚵‍♀️🚵🚵‍♂️🚴‍♀️🚴🚴‍♂️"
            }
        }
        
        var name: String { rawValue }

    }
}

