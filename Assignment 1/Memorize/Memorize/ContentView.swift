//
//  ContentView.swift
//  Memorize
//
//  Created by Mariam Ormotsadze on 12/19/21.
//

import SwiftUI

struct ContentView: View {
    var vehicleEmojis = ["đ˛", "đ" ,"đ" , "đ" , "đ", "đ", "đ", "đ", "đ", "âī¸", "đ", "âĩī¸", "đ¸", "đļ", "đ", "đ", "đē", "đ ", "đĩ", "đ", "đ", "đ", "đģ", "đ"]
    var animalEmojis = ["đĨ", "đĻ", "đĻ", "đĻ", "đ", "đĻ", "đ", "đĸ", "đ", "đĻ", "đĻ", "đĻ", "đĻ­", "đ", "đĻ", "đĢ", "đĻ", "đĻ", "đ", "đ", "đ", "đ", "đĻĢ", "đĻĻ"]
    var foodEmojis = ["đ", "đ", "đ", "đĨĒ", "đĨ", "đŽ", "đ¯", "đĨ", "đĨ", "đ", "đĨŠ", "đĨ", "đ§", "đŗ", "đĨ", "đ", "đĨĢ", "đŖ", "đĨ", "đ¤", "đĢ", "đŋ", "đŠ", "đĒ"]
    
    @State var currentEmojis = ["đ˛", "đ" ,"đ" , "đ" , "đ", "đ", "đ", "đ", "đ", "âī¸", "đ", "âĩī¸", "đ¸", "đļ", "đ", "đ", "đē", "đ ", "đĩ", "đ", "đ", "đ", "đģ", "đ"]
    
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
