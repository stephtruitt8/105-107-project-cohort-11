//
//  ContentView.swift
//  AnimationMoodCohort11
//
//  Created by Stephen Truitt on 9/10/26.
//

import SwiftUI

struct Mood{
    let emoji:String
    let label:String
    let color:Color
}

let moods: [Mood] = [
    Mood(emoji: "😡", label: "Angry", color: .red),
    Mood(emoji: "☺️", label: "Flirty", color: .pink),
    Mood(emoji: "😴", label: "Sleepy", color: .blue),
    Mood(emoji: "😒", label: "Annoyed", color:.yellow),
]


struct ContentView: View {
    
    @State var moodIndex: Int = 0
    @State var isPressed: Bool = false
    
    var body: some View {
        
        let currentMood = moods[moodIndex]
        
        ZStack{
            
            currentMood.color.opacity(0.15).ignoresSafeArea()
            
            VStack(spacing:40){
                Text("How are you feeling?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                
                
                Text(currentMood.emoji)
                    .font(.system(size: 100))
                    .scaleEffect(isPressed ? 0.75 : 1)
                    .animation(
                        .spring(response:0.53, dampingFraction: 0.3),
                        value: isPressed
                    )
                    .onTapGesture {
                        //trigger change
                        isPressed = true
                        
                        withAnimation(.easeInOut(duration: 0.5)){
                            
                            moodIndex = (moodIndex + 1) % moods.count
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                                isPressed = false
                                
                            }
                        }
                    }
                        
                        
                Text(currentMood.label)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(currentMood.color)
                            .id(moodIndex)
                
                            .transition(
                                .asymmetric(
                                    insertion: .move(edge: .bottom).combined(with: .opacity),
                                    removal: .move(edge: .top).combined(with: .opacity))
                                )
                        
                    Text("Tap the emoji to change your mood")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
        }.animation(.easeInOut(duration: 0.7), value: moodIndex)
        
    }
}

#Preview {
    ContentView()
}
