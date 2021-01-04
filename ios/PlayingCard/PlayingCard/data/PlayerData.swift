//
//  PlayerData.swift
//  PlayingCard
//
//  Created by iblis on 28/12/2020.
//

import Foundation

class PlayerData {
    
    private var cards:[Card] = []
    
    var numberOfCards:Int {
        return cards.count
    }
    
    func addCard(card: Card){
        cards.append(card)
    }
    
    func getAndRemoveFirst() -> Card? {
        
        if cards.count == 0 {
            return nil
        }
        
        let card = cards[0]
        cards.remove(at: 0)
        return card
    }
}
