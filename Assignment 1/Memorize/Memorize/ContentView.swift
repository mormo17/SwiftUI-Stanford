//
//  ContentView.swift
//  Memorize
//
//  Created by Mariam Ormotsadze on 12/19/21.
//

import SwiftUI

struct ContentView: View {
    var vehicleEmojis = ["🚲", "🚂" ,"🚁" , "🚜" , "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    var animalEmojis = ["🐥", "🦉", "🦇", "🦄", "🐝", "🦋", "🐌", "🐢", "🐙", "🦕", "🦑", "🦞", "🦭", "🐊", "🦓", "🐫", "🦒", "🦘", "🐄", "🐖", "🐏", "🐇", "🦫", "🦦"]
    var foodEmojis = ["🍔", "🍟", "🍕", "🥪", "🥙", "🌮", "🌯", "🥗", "🥘", "🍗", "🥩", "🥓", "🧇", "🍳", "🥐", "🍝", "🥫", "🍣", "🥟", "🍤", "🍫", "🍿", "🍩", "🍪"]
    
    @State var currentEmojis = ["🚲", "🚂" ,"🚁" , "🚜" , "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 55))]) {
                    ForEach(currentEmojis[0..<currentEmojis.count], id: \.self) { emoji in
                        CardView(content: emoji, isFaceUp: false)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            
            HStack {
                vehiclesButton
                Spacer()
                animalsButton
                Spacer()
                foodButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding()
    }
    
    var vehiclesButton: some View {
        VStack {
            Button { currentEmojis = vehicleEmojis.shuffled() }
            label: { NavigationButtonData(imageName: "car", title: "Vehicles") }
        }
    }
    
    var animalsButton: some View {
        VStack {
            Button { currentEmojis = animalEmojis.shuffled() }
            label: { NavigationButtonData(imageName: "hare", title: "Animals") }
        }
    }
    
    var foodButton: some View {
        VStack {
            Button { currentEmojis = foodEmojis.shuffled() }
            label: { NavigationButtonData(imageName: "cart", title: "Food") }
        }
    }
}

struct NavigationButtonData: View {
    var imageName: String
    var title: String
    var body: some View{
        VStack {
            Image(systemName: imageName)
            Text(title).font(.subheadline)
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
