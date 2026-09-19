//
//  SettingsView.swift
//  FlashcardCoHo11
//
//  Created by Stephen Truitt on 9/12/26.
//

import SwiftUI

struct SettingsView:View {
    
    @AppStorage("showBackFirst") private var showBackFirst:Bool = false
    @AppStorage("shuffleCards") private var shuffleCards:Bool = true
    @AppStorage("cardsPerSession") private var cardsPerSession:Int = 1
    @AppStorage("darkMode") private var darkMode:Bool = false
    @AppStorage("dailyGoal") private var dailyGoal:Int = 10
    @AppStorage("userName") private var userName:String = "John Doe"
    
    var body: some View {
        Form{
            Section("Study"){
                Toggle("Shuffle cards",isOn: $shuffleCards)
                Toggle("Show back first",isOn: $showBackFirst)
                
                Stepper("Cards per session: \(cardsPerSession)", value: $cardsPerSession, in: 1...30)
            }
            
            Section("General") {
                Toggle("Dark Mode", isOn: $darkMode)
                
                Stepper(
                    "Daily goal: \(dailyGoal)",
                    value: $dailyGoal,
                    in: 1...100
                )
                
                
            }
            
        }
        .navigationTitle("Settings")
        .preferredColorScheme(darkMode ? .dark : .light)
    }
}

#Preview{
    SettingsView()}
