//
//  Concentration.swift
//  Concentration
//
//  Created by Yaohua Sun on 9/20/18.
//  Copyright © 2018 ChinaAdventureDev. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = Array<Card>()
    
   /* func chooseCard(at index: Int) {
        if cards[index].isFaceUp{
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }*/
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard( at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        //for identifier in 1...numberOfPairsOfCards{
        for _ in 1...numberOfPairsOfCards{
            //let card = Card(identifier: identifier)
            // when you passing structs around, you are copying them
            let card = Card()
            
            cards += [card,card]
            
            //let matchingCard = card
            //cards.append(card)
            //cards.append(matchingCard) // when you passing structs around, you are copying them
            //cards.append(card)
        }
        
        // TODO: Shuffle the cards, just do a randomization of the card array
        
    }
}
