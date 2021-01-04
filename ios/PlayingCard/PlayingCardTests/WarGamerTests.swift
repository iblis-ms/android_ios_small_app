//
//  ViewControllerTests.swift
//  PlayingCardTests
//
//  Created by iblis on 28/12/2020.
//

import XCTest
@testable import Cuckoo

@testable import PlayingCard


class WarGameTests: XCTestCase {
    
    func testWarGame(){
        let mock = MockWarGameListener()
        let warGame = WarGame(mock)
        
        var actualCpuCard:Card? = nil
        var actualCpuCardLeft:Int? = nil
        var actualPlayerCard:Card? = nil
        var actualPlayerCardLeft:Int? = nil
        
        stub(mock){ mock in
            let _ = when(mock.onGame(cpuCard: any(), cpuCardLeft: any(), playerCard: any(), playerCardLeft: any())).then { (arg0) in
                
                let (cpuCard, cpuCardLeft, playerCard, playerCardLeft) = arg0
                actualCpuCard = cpuCard
                actualCpuCardLeft = cpuCardLeft
                actualPlayerCard = playerCard
                actualPlayerCardLeft = playerCardLeft
            }
        }
        warGame.restartGame()
        warGame.play()
        XCTAssertNotNil(actualCpuCard)
        XCTAssertNotNil(actualCpuCardLeft)
        XCTAssertNotNil(actualPlayerCard)
        XCTAssertNotNil(actualPlayerCardLeft)
        XCTAssertNotEqual(actualCpuCardLeft, actualPlayerCardLeft)
    }
}

