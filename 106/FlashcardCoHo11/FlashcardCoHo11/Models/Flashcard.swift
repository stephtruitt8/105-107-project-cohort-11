//
//  Flashcard.swift
//  FlashcardCoHo11
//
//  Created by Stephen Truitt on 9/12/26.
//

import Foundation


//Model - Flashcard Structure
struct Flashcard:Identifiable{
    
    let id:UUID = UUID()
    var front: String
    var back: String
    
    
}

//Model 2 - Deck Structure -  Contains Decks
// each deck contains x number of cards, it also has a name related to the topic and it is identifiable.

struct Deck: Identifiable{
    
    let id: UUID = UUID()
    var name: String
    var cards: [Flashcard]
    
    
}


