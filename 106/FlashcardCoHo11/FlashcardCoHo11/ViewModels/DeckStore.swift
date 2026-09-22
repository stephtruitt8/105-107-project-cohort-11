//
//  DeckStore.swift
//  FlashcardCoHo11
//
//  Created by Stephen Truitt on 9/12/26.
//

import SwiftUI

import Foundation
import Combine

@MainActor
class DeckStore:ObservableObject{
    
    @Published var decks:[Deck] = [
        
    Deck(
        name: "Spanish",
        cards: [Flashcard(question: "Hello", Answer: "Hola")])
        
//        Deck(
//            name: "Swift",
//            cards: [
//            Flashcard(
//                front: "let vs var",
//                back: "let is constant, var mutates"),
//            Flashcard(front: "Optional", back: "This is a nil value")
//        ])
//        ,
//        Deck(name: "Spanish", cards: [
//            Flashcard(front: "Hello", back: "Hola"),
//            Flashcard(front: "Goodbye", back: "Adios"
//                     
//                )
//            ]
//        )
    ]
    
    func addDeck( deck:Deck){
        let cleanName = deck.name.trimmingCharacters(in: .whitespacesAndNewlines
        )
        
        let newDeck = Deck(
            name: cleanName,
            cards: []
        )
        
        decks.append(newDeck)
    }
    
    func addCard(
        to deckID: UUID,
        front: String,
        back: String
    ){
        let _cleanFront = front.trimmingCharacters(in: .whitespacesAndNewlines
        )
        let _cleanBack = back.trimmingCharacters(in: .whitespacesAndNewlines
        )
        
    }
    
    
    //deletes
    func deletesDecks(at offsets: IndexSet) {
        decks.remove(atOffsets: offsets)
    }
}

