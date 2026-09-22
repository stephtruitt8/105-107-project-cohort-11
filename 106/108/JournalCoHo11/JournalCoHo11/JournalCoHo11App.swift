//
//  JournalCoHo11App.swift
//  JournalCoHo11
//
//  Created by Stephen Truitt on 9/20/26.
//

import SwiftUI
import SwiftData

@main
struct JournalCoHo11App: App {
    
    // 1 - Safer Approuch
    
//    var modelContainer:ModelContainer = {
//        do{
//            return try ModelContainer(for: JournalEntry.self)
//        } catch {
//            fatalError("Error Loading Container...")
//        }
//        
//    }()
    
    var body: some Scene {
        WindowGroup {
           
            // Main View goes here
            NavigationStack{
                EntryListView()
            }
            
        }.modelContainer(for:JournalEntry.self)
    }
}

#Preview {
    
}
