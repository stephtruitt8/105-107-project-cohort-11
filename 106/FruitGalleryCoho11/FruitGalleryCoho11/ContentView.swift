//
//  ContentView.swift
//  FruitGalleryCoho11
//
//  Created by Stephen Truitt on 9/11/26.
//



//MVVM
//Model -> Template for object, custom package or type
//ViewModels -> Backbone of an app, logic
//Views
//    -> Components(Small elements, buttons, images and containers)
//    -> Layouts (Combination of Components and elements)




import SwiftUI


let fruits: [Fruit] = [
    Fruit(emoji: "🍎", name: "Apple", color: .red),
    Fruit(emoji: "🍍", name: "Pineapple", color: .yellow),
    Fruit(emoji: "🍓", name: "Strawberry", color: .purple),
    Fruit(emoji: "🍉", name: "Watermelon", color: .green),
    Fruit(emoji: "🍎", name: "Apple", color: .red),
    Fruit(emoji: "🍍", name: "Pineapple", color: .yellow),
    Fruit(emoji: "🍓", name: "Strawberry", color: .purple),
    Fruit(emoji: "🍉", name: "Watermelon", color: .green),
    Fruit(emoji: "🍎", name: "Apple", color: .red),
    Fruit(emoji: "🍍", name: "Pineapple", color: .yellow),
    Fruit(emoji: "🍓", name: "Strawberry", color: .purple),
    Fruit(emoji: "🍉", name: "Watermelon", color: .green),
    Fruit(emoji: "🍎", name: "Apple", color: .red),
    Fruit(emoji: "🍍", name: "Pineapple", color: .yellow),
    Fruit(emoji: "🍓", name: "Strawberry", color: .purple),
    Fruit(emoji: "🍉", name: "Watermelon", color: .green),
    Fruit(emoji: "🍎", name: "Apple", color: .red),
    Fruit(emoji: "🍍", name: "Pineapple", color: .yellow),
    Fruit(emoji: "🍓", name: "Strawberry", color: .purple),
    Fruit(emoji: "🍉", name: "Watermelon", color: .green),
    Fruit(emoji: "🍎", name: "Apple", color: .red),
    Fruit(emoji: "🍍", name: "Pineapple", color: .yellow),
    Fruit(emoji: "🍓", name: "Strawberry", color: .purple),
    Fruit(emoji: "🍉", name: "Watermelon", color: .green),
    Fruit(emoji: "🍎", name: "Apple", color: .red),
    Fruit(emoji: "🍍", name: "Pineapple", color: .yellow),
    Fruit(emoji: "🍓", name: "Strawberry", color: .purple),
    Fruit(emoji: "🍉", name: "Watermelon", color: .green),
    Fruit(emoji: "🍎", name: "Apple", color: .red),
    Fruit(emoji: "🍍", name: "Pineapple", color: .yellow),
    Fruit(emoji: "🍓", name: "Strawberry", color: .purple),
    Fruit(emoji: "🍉", name: "Watermelon", color: .green),
    
]


struct ContentView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.fixed(25)),
    ]
    
    var body: some View {
        ScrollView{
            VStack {
                HeaderComponent()
                //            VStack{
                //                ForEach(fruits, id: \.name) { fruits in
                //                    FruitCard(fruit: fruits)
                
                LazyVGrid(columns: columns,spacing: 15){
                    
                    ForEach(fruits) { item in
                        
                        FruitCard(fruit: item)
                    }
                    
                }
                
            }
            .padding()
        }
    }
}





// Parent
#Preview {
    ContentView()
//    FruitCard(fruit: fruits[0])
//    FruitCard(fruit: fruits[1])
//    FruitCard(fruit: fruits[2])
//    
//    HeaderComponent()
}
