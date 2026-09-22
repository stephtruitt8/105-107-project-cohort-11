//
//  FlashcardsView.swift
//  FlashcardCoHo11
//
//  Created by Stephen Truitt on 9/19/26.
//

import SwiftUI

struct AddFlashcardsView: View {
    
    @EnvironmentObject var store: DeckStore
    @Environment(\.dismiss) private var dismiss
    
    let deckID: UUID
    
    @State private var front: String = ""
    @State private var back: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("Question") {
                    TextField("Enter the question",
                        text: $front,
                        axis: .vertical
                    )
                
                }
                
                Section("Answer") {
                    TextField("Enter the answer",
                              text: $back,
                              axis: .vertical
                            )
                }
            }
            .navigationTitle(Text("Add a new flashcard"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        store.addCard(
                            to: deckID,
                            front: front,
                            back: back
                        )
                        
                        dismiss()
                    }
                    .disabled(
                        front.trimmingCharacters(
                            in: .whitespacesAndNewlines
                        ).isEmpty ||
                        back.trimmingCharacters(
                            in: .whitespacesAndNewlines
                        ).isEmpty
                        
                    )
                }
            }
        }
    }
}
