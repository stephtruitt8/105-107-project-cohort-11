//
//  Untitled.swift
//  FlashcardCoHo11
//
//  Created by Stephen Truitt on 9/19/26.
//

import SwiftUI

struct AddDecksView: View {
    
    @EnvironmentObject var store: DeckStore
    @Environment(\.dismiss) private var dismiss
    
    @State private var deckName: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Deck Information") {
                    TextField("Deck name", text: $deckName)
                }
            }
            .navigationTitle("Add Deck")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction){
                    Button("Add") {
                        store.addDeck(deck: Deck(name: deckName))
                        dismiss()
                    }
                    .disabled(
                        deckName.trimmingCharacters(
                            in: .whitespacesAndNewlines
                        ).isEmpty
                    )
                }
            }
        }
    }
}
