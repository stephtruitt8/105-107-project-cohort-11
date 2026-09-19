//
//  FruitCard.swift
//  FruitGalleryCoho11
//
//  Created by Stephen Truitt on 9/11/26.
//

import SwiftUI


struct FruitCard:View {
    
    let fruit:Fruit
    
    var body: some View {
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 16).fill(fruit.color.opacity(0.40))
            
            VStack(spacing: 16){
                
                Text(fruit.emoji).font(.system(size: 40))
                Text(fruit.name).font(.caption).bold()
                
            }.padding()
        
        }
        .frame(maxWidth: .infinity)
        .frame(height: 110)
        
    }
}
// temp Parent for our card
#Preview {
    HStack{
        FruitCard(fruit: fruits[0])
        FruitCard(fruit: fruits[1])
        FruitCard(fruit: fruits[2])
    }
}
