//
//  JournalEntry.swift
//  JournalCoHo11
//
//  Created by Stephen Truitt on 9/20/26.
//

import Foundation
import SwiftData

//.1 - Create the table

@Model
class JournalEntry{
    
    var title: String
    var body: String
    var isFavorite: Bool
    var date: Date
    var category: String = "General"
    var isArchived: Bool = false
    
    init(title: String, body: String, isFavorite: Bool = false, date: Date = .now, category: String = "General",isArchived: Bool = false) {
        self.title = title
        self.body = body
        self.isFavorite = isFavorite
        self.date = date
        self.category = category
        self.isArchived = false
        
    }
}

let entry1:JournalEntry = JournalEntry(title: "My First Entry", body: "This is my first entry")

//Title
//Description
//ID
//isFavorite
//Date



