//
//  Card.swift
//  PlayingCard
//
//  Created by iblis on 28/12/2020.
//

import Foundation

enum CardFigure : Int, CaseIterable, Comparable, Equatable {
  
    
    case TWO = 2, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN
    case JACK = 11, QUEEN, KING
    case ACE = 14
    case JOKER = 15
    
    static func < (lhs: CardFigure, rhs: CardFigure) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

enum CardColor : Int, CaseIterable, Comparable, Equatable{
    case HEARTS = 0, DAIMONDS, CLUBS, SPADES
    
    static func < (lhs: CardColor, rhs: CardColor) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

class Card : Equatable{
    
    var figure:CardFigure
    var color:CardColor
    
    init(figure:CardFigure, color:CardColor){
        self.figure = figure
        self.color = color
    }
    
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.figure == rhs.figure && lhs.color == rhs.color
    }
    
}
