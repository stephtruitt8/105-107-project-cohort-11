//
//  DeckDetailsView.swift
//  FlashcardCoHo11
//
//  Created by Stephen Truitt on 9/20/26.
//

import SwiftUI

struct DeckDetailsView: View {
    
    
    @EnvironmentObject var store: DeckStore
    
    let deck: UUID
    
    @State private var showingAddCard = false
    
    var body: some View {
        Group {
            if let deck = $store.deck(withID: deck) {
                List {
                    Section("Cards") {
                        ForEach(deck.cards) { card in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(card.question)
                                    .font(.headline)
                                
                                Text(card.Answer)
                                    .foregroundStyle(.secondary)
                                
                            }
                        }
                        .onDelete { offsets in
                            store.deleteCards(
                                from:  deck,
                                at: offsets )
                        }
                    }
                }
                
                Section {
                    NavigationLink("Study This Deck") {
                        StudyView(deck: deck)
                        
                    }
                    .disabled(deck.cards.isEmpty)
                }
            }
                .navigationTitle(deck.name)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showingAddCard = true
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                    }
                    
                    ToolbarItem(placement: .bottomBar) {
                        EditButton()
                    }
                    
                }
                .sheet(isPresented: $showingAddCard) {
                    AddFlashcardsView(deckID: deck)
                    
                }
            }
    }
}
