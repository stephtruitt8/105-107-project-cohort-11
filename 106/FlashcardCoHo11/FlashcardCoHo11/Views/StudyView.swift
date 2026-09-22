//
//  Study.swift
//  FlashcardCoHo11
//
//  Created by Stephen Truitt on 9/12/26.
//

import SwiftUI

struct StudyView:View {
    let deck:Deck
    
    @State private var index:Int = 0
    @State private var isFlipped:Bool = false
    @State private var sessionCards:[Flashcard] = []
    
    @AppStorage("showBackFirst") private var showBackFirst:Bool = false
    @AppStorage("shuuffleCards") private var shuffleCards:Bool = true
    @AppStorage("cardsPerSession") private var cardsPerSession:Int = 1
    @AppStorage("cardFontSize") private var cardFontSize:Double = 20
    
    
    var body: some View {
        
        
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            
            VStack{
                
                if sessionCards.isEmpty {
                    Text("There is no cards inside this deck")
                }else{
                    Text("\(index+1) / \(sessionCards.count)")
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.thinMaterial)
                            .frame(height: 220)
                        
                        Text(currentText)
                            .font(.system(size: CGFloat(cardFontSize)))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        
                    }.onTapGesture {
                        isFlipped.toggle()
                    }
                    
                    Text("Font Size: \(cardFontSize, specifier: "%.0f"))")
                        .padding()
                    
                    Slider(value: $cardFontSize, in: 1...50)
                    
                    HStack{
                        // Disable button if there is no previous cards
                        Button("Prev"){
                            prev()
                        }
                        
                        Button("Flip"){
                            isFlipped.toggle()
                        }
                        // Disable button if there is no next card
                        Button("Next"){
                            next()
                        }
                    }
                }
                
            }
            .navigationTitle(deck.name)
            .onAppear {
                startSession()
            }
            
        }
        
        
    }
    
    //Computed property
    private var currentText:String {
        
        guard !sessionCards.isEmpty else { return "" }
        
        let card = sessionCards[index]
        
        let showFront = showBackFirst ? isFlipped : !isFlipped
        
        return showFront ? card.question : card.Answer
    }
    
    func startSession(){
        var cards = deck.cards
        if shuffleCards {cards.shuffle()}
        
        let limit = min(cardsPerSession, cards.count)
        
        sessionCards = Array(cards.prefix(limit))
        index = 0
        isFlipped = false
    }
    
    func next(){
        if index < sessionCards.count - 1 {
            index += 1
            isFlipped = false
        }
    }
    
    func prev(){
        if index > 0 {
            index -= 1
            isFlipped = false
        }
    }
}

#Preview {
    StudyView(deck:Deck(name: "Demo", cards: [Flashcard(question: "Front", Answer: "Back")]))
}
