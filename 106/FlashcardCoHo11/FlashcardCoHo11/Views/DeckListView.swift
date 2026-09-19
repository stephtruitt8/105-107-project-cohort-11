//
//  DeckListView.swift
//  FlashcardCoHo11
//
//  Created by Stephen Truitt on 9/12/26.
//

import SwiftUI

struct DeckListView: View {
    @EnvironmentObject var store:DeckStore
    
    var body: some View {
        
        List{
            Section(){
                ForEach(store.decks){ deck in
                    NavigationLink{
                        StudyView(deck:deck)
                    } label: {
                        HStack(spacing: 16){
                            Image(systemName: "rectangle.stack.fill")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .frame(width: 48, height: 48)
                                .background(
                                    LinearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing
                                                  )
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 12)
                                )
                            
                            VStack(alignment: .leading, spacing: 4){
                                Text(deck.name)
                                    .font(.headline)
                                    .foregroundStyle(.primary)
                                
                                Spacer()
                                
                                Text("\(deck.cards.count)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding(.vertical, 7)
                    }
                }
            } header: {
                Text("My Decks")
                    .font(.headline)
            }
        }
        .navigationTitle("Flashcard App")
        .multilineTextAlignment(.center)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                NavigationLink {
                    SettingsView()
                } label:{
                    Image(systemName:"gearshape.fill")
                }
                .accessibilityLabel("Settings")
            }
        }
    }
}
