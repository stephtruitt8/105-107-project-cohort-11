//
//  GesturesView.swift
//  Locs shop-cohort 11
//
//  Created by Stephen Truitt on 8/12/26.
//

import SwiftUI

struct GesturesView: View {
    let paragraph: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis ante ac dui laoreet tempus. Donec nec consectetur nisl. Duis porta scelerisque eros ut egestas. Duis suscipit dignissim risus, eu cursus dolor vulputate nec. Mauris vel aliquet purus."
    
    @State private var isExpanded: Bool = false
    @State private var isLiked: Bool = false
    
    var body: some View {
        
        // Mark -  Exercise 1: Tap
        // .onTapGesture -> Text, Image, Stack (V, H, Z)
        Text("Tap Please")
            .onTapGesture {
                print("Tapped")
            }
        
        // Mark - 2. Tap - Expand/Compress Text with a Tap
        VStack(alignment:.leading, spacing:10){
            
            Text(paragraph)
                .lineLimit(isExpanded ? nil : 2)
            
            Text(isExpanded ? "Show Less" : "Show More")
                .italic()
                .foregroundStyle(Color.blue)
                .onTapGesture {
                    isExpanded.toggle()
                }
            
        }
        .padding()
        
        //Mark - 3. Double Tap
        Text("Double Tap")
            .onTapGesture(count: 2) {
                print("Double Tapped")
            }
        
        //Mark: 4. Double Tap - Like/Favorite
        Image(systemName: isLiked ? "heart.fill" : "heart")
            .foregroundStyle(isLiked ? .red : .gray)
            .padding()
            .onTapGesture(count: 2){
                isLiked.toggle()
            }
    }
}

#Preview {
    GesturesView()
}
