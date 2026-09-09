//
//  ContentView.swift
//  Locs shop-cohort 11
//
//  Created by Stephen Truitt on 8/10/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var volume: Double = 0.0
    
    var body: some View {
        VStack(spacing:30){
            //MARK -  Slider - Dynamic Type Face
            
            Text("Accessiblity Practice!")
                .font(.largeTitle)
                .accessibilityAddTraits(.isHeader)
                .accessibilityIdentifier("titleText")
                
            
            Text("Hello Class~")
                .font(.system(size:30))
            
            //mark - slider - label
            Button{
                // Code
            } label: {
                Image(systemName: "heart.fill")
            }
            .accessibilityLabel("Add to Favorites")
            .accessibilityHint("The element is added to your favorites list")
            
            // MARK: - Slider - Value
            Slider(value: $volume)
                .accessibilityValue("\(volume * 100.0, specifier: "%.0f") percent volume")
            
        }
        .padding()
    }
    
        
}

#Preview {
    ContentView()
}
