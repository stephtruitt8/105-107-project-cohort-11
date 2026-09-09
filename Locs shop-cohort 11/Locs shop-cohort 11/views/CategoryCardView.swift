//
//  CategoryCardView.swift
//  Locs shop-cohort 11
//
//  Created by Stephen Truitt on 8/10/26.
//

import SwiftUI

struct CategoryCardView<Destination: View>: View {
    
    let icon: String
    let category: String
    let destination: Destination
    
    var body: some View {
        
        NavigationLink {
            // Links to?
            destination
            
        } label : {
            
            VStack(spacing:8){
                Image(systemName: icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color("BgColor2"))
                    .clipShape(.circle)
                    .foregroundStyle(Color("SurfaceColor"))
                
                Text(category)
                    .font(.headline)
                    .foregroundStyle(.black)
            }
            .frame(width: 100, height: 100)
            .background(.white)
            .cornerRadius(15)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text(category))
        .accessibilityHint(Text("Displaying \(category) products"))
    }
}

#Preview {
    CategoryCardView(icon: "eye", category: "Lashes", destination: CategoryView())
}
