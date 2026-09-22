//
//  EntryForm.swift
//  JournalCoHo11
//
//  Created by Stephen Truitt on 9/20/26.
//

import SwiftUI
import SwiftData

struct EntryFormView: View {
    
    //
    @Environment(\.dismiss) var dismiss
    
    // We use this context
    @Environment(\.modelContext) var context
    let entry:JournalEntry? // if == nil -> create a new one
    
    
    
    @State private var title: String = ""
    @State private var entryBody: String = ""
    @State private var isFavorite: Bool = false
    @State private var category: String = ""
    
    var body: some View {
        Form{
            Section("Title"){
                TextField("Enter title...",text:$title)
            }
            
            Section("Body"){
                TextEditor(text: $entryBody)
                    .frame(minHeight: 220)
            }
            
            Section("Category") {
                Picker("Select Category", selection: $category) {
                               Text("Personal").tag("Personal")
                               Text("School").tag("School")
                               Text("Work").tag("Work")
                               Text("Ideas").tag("Ideas")
                    }
            }
            
            Section("Favorite"){
                Toggle("Mark as favorite",isOn: $isFavorite)
            }
            
        }
        .navigationTitle(entry == nil ? "New Entry" : "Edit Entry")
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button("Cancel"){dismiss()}
                
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                // save
                Button("Save"){
                    save()
                }.disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .onAppear {
            guard let entry else {return}
            title = entry.title
            entryBody = entry.body
            isFavorite = entry.isFavorite
        }
    }
    
    private func save(){
        // get rid of white spaces
        let t = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let b = entryBody.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // IF TITLE IS EMPTY RETURN
        guard !t.isEmpty else {return}
        
        if let entry {
            entry.title = t
            entry.body = b
            entry.isFavorite = isFavorite
            entry.category = category
            
            
        }else{
            //insert new entry
            context.insert(JournalEntry(title: t, body: b, isFavorite: isFavorite, category: category))
        }
        dismiss()
        
    }
    
}

#Preview {
    NavigationStack{
        EntryFormView(entry: nil)
    }
}
