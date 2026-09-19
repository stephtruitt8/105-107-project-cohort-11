//
//  DeckStore.swift
//  FlashcardCoHo11
//
//  Created by Stephen Truitt on 9/12/26.
//

import Foundation
import Combine

class DeckStore:ObservableObject{
    
    @Published var decks:[Deck] = [
        Deck(name: "Swift", cards: [
            Flashcard(front: "let vs var", back: "let is constant, var mutates"),
            Flashcard(front: "Optional", back: "This is a nil value")
        ])
        ,
        Deck(name: "Spanish", cards: [
            Flashcard(front: "Hello", back: "hela"),
            Flashcard(front: "Goodbye", back: "adios"),
            
        ])
    ]
}
