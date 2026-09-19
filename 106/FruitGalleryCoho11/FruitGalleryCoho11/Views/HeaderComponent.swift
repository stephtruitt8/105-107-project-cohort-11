//
//  HeaderComponent.swift
//  FruitGalleryCoho11
//
//  Created by Stephen Truitt on 9/11/26.
//
import SwiftUI

// Header



struct HeaderComponent: View {
    var body: some View {
        HStack{
            Text("Fruit Gallery").font(.title2).bold()
            
            Text("Fruit: .\(fruits.count)")
                .foregroundStyle(.secondary)
            
        }.padding(.horizontal)
    }
}

#Preview {
    HeaderComponent()
}
