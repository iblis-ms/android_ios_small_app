//
//  PlayingCardTests.swift
//  PlayingCardTests
//
//  Created by iblis on 28/12/2020.
//

import XCTest
@testable import PlayingCard

class PlayerDataTest: XCTestCase {

    func testEmptyPlayer() throws {
        let playerData = PlayerData()
        let card:Card? = playerData.getAndRemoveFirst()
        XCTAssertNil(card)
        
        XCTAssertEqual(playerData.numberOfCards, 0)
    }
    
    func testOneCardPlayer() throws {
        
        let playerData = PlayerData()
        let card = Card(figure: CardFigure.ACE, color: CardColor.CLUBS)
        playerData.addCard(card: card)
        
        XCTAssertEqual(playerData.numberOfCards, 1)
        let actualCard:Card? = playerData.getAndRemoveFirst()
        XCTAssertNotNil(actualCard)
        XCTAssertEqual(playerData.numberOfCards, 0)
        
        XCTAssertEqual(card, actualCard)
        
        let cardAfterRemovingAllCards:Card? = playerData.getAndRemoveFirst()
        XCTAssertNil(cardAfterRemovingAllCards)
        XCTAssertEqual(playerData.numberOfCards, 0)
    }
    
    func testManyCars() throws {
        
        let playerData = PlayerData()
        let cards:[Card] = [
            Card(figure: CardFigure.ACE, color: CardColor.CLUBS),
            Card(figure: CardFigure.JACK, color: CardColor.HEARTS),
            Card(figure: CardFigure.TWO, color: CardColor.DAIMONDS),
            Card(figure: CardFigure.FIVE, color: CardColor.SPADES),
        ]
        
        cards.forEach {
            playerData.addCard(card: $0)
        }
        XCTAssertEqual(playerData.numberOfCards, cards.count)
        
        for counter in 0..<cards.count {
            let actualCard = playerData.getAndRemoveFirst()
            XCTAssertEqual(cards[counter], actualCard)
        }
        let cardAfterRemovingAllCards:Card? = playerData.getAndRemoveFirst()
        XCTAssertNil(cardAfterRemovingAllCards)
        XCTAssertEqual(playerData.numberOfCards, 0)
    }

}
