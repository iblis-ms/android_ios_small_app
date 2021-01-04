//
//  PlayingCardTests.swift
//  PlayingCardTests
//
//  Created by iblis on 28/12/2020.
//

import XCTest
@testable import PlayingCard

class CardFigureTests: XCTestCase {

    func testCardFigureValues() throws {//CardFigure
        XCTAssertEqual(CardFigure.TWO.rawValue, 2)
        XCTAssertEqual(CardFigure.THREE.rawValue, 3)
        XCTAssertEqual(CardFigure.FOUR.rawValue, 4)
        XCTAssertEqual(CardFigure.FIVE.rawValue, 5)
        XCTAssertEqual(CardFigure.SIX.rawValue, 6)
        XCTAssertEqual(CardFigure.SEVEN.rawValue, 7)
        XCTAssertEqual(CardFigure.EIGHT.rawValue, 8)
        XCTAssertEqual(CardFigure.NINE.rawValue, 9)
        XCTAssertEqual(CardFigure.TEN.rawValue, 10)
        XCTAssertEqual(CardFigure.JACK.rawValue, 11)
        XCTAssertEqual(CardFigure.QUEEN.rawValue, 12)
        XCTAssertEqual(CardFigure.KING.rawValue, 13)
        XCTAssertEqual(CardFigure.ACE.rawValue, 14)
        XCTAssertEqual(CardFigure.JOKER.rawValue, 15)
    }
    
    func testcCardFigureLess() throws {
        let allCards = CardFigure.allCases
        for index1 in 1..<allCards.count {
            for index2 in 0..<index1 {
                XCTAssertLessThan(allCards[index2], allCards[index1])
            }
        }
        
    }
}

class CardColorTests: XCTestCase {
    
    func testCardColorValue() throws {
        XCTAssertEqual(CardColor.HEARTS.rawValue, 0)
        XCTAssertEqual(CardColor.DAIMONDS.rawValue, 1)
        XCTAssertEqual(CardColor.CLUBS.rawValue, 2)
        XCTAssertEqual(CardColor.SPADES.rawValue, 3)
        
    }
    
    func testCardColorLess() throws {
        let allCards = CardColor.allCases
        for index1 in 1..<allCards.count {
            for index2 in 0..<index1 {
                XCTAssertLessThan(allCards[index2], allCards[index1])
            }
        }
        
    }
}


class CardTests: XCTestCase {
    
    func testCardColorLess() throws {
        let card1 = Card(figure: CardFigure.THREE, color: CardColor.HEARTS)
        let card2 = Card(figure: CardFigure.THREE, color: CardColor.HEARTS)
        let cardDifferent1 = Card(figure: CardFigure.KING, color: CardColor.HEARTS)
        let cardDifferent2 = Card(figure: CardFigure.THREE, color: CardColor.CLUBS)
        let cardDifferent3 = Card(figure: CardFigure.SIX, color: CardColor.CLUBS)
        
        XCTAssertEqual(card1, card2)
        XCTAssertNotEqual(card1, cardDifferent1)
        XCTAssertNotEqual(card1, cardDifferent2)
        XCTAssertNotEqual(card1, cardDifferent3)
        
    }
}
