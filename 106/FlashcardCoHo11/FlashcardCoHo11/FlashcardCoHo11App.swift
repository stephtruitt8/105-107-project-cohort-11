//
//  FlashcardCoHo11App.swift
//  FlashcardCoHo11
//
//  Created by Stephen Truitt on 9/12/26.
//

import SwiftUI

@main
struct FlashcardCoHo11App: App {
    @AppStorage("darkMode") private var darkMode: Bool = false
    
    @StateObject var store = DeckStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                DeckListView()
                    .preferredColorScheme(darkMode ? .dark : .light)
            }.environmentObject(store)
        }
    }
}
