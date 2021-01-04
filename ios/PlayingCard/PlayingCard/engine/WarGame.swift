//
//  WarGame.swift
//  PlayingCard
//
//  Created by iblis on 28/12/2020.
//

import Foundation

protocol WarGameListener : class {
    func onGame(cpuCard:Card, cpuCardLeft:Int, playerCard:Card, playerCardLeft:Int)
}

class WarGame{
    var player = PlayerData()
    var cpu = PlayerData()
    private var cards:[Card] = []
    private weak var listener:WarGameListener?
    private var playerVisibleCard:Card? = nil
    private var cpuVisibleCard:Card? = nil
    
    init(_ listener: WarGameListener){
        self.listener = listener
        for color in CardColor.allCases{
            for figure in CardFigure.allCases {
                cards.append(Card(figure: figure, color: color))
            }
        }
    }
    
    func restartGame(){
        for card in cards {
            if card.figure != .JOKER {
                if Int.random(in: 0...1) == 0 {
                    player.addCard(card: card)
                }
                else {
                    cpu.addCard(card: card)
                }
            }
        }
    }
    
    enum WinResult {
        case PLAYER_WIN
        case CPU_WIN
        case DRAW
    }
    
    private func fight(playerCard:Card, cpuCard:Card) -> WinResult{
        if playerCard.figure.rawValue > cpuCard.figure.rawValue {
            player.addCard(card: playerCard)
            player.addCard(card: cpuCard)
            playerVisibleCard = playerCard
            cpuVisibleCard = cpuCard
            playerVisibleCard = playerCard
            cpuVisibleCard = cpuCard
            return .PLAYER_WIN
        }
        else if (playerCard.figure.rawValue == cpuCard.figure.rawValue) {
             return threeCardWar(playerFirstCard: playerCard, cpuFirstCard: cpuCard)
        }
        else {
            cpu.addCard(card: cpuCard)
            cpu.addCard(card: playerCard)
            playerVisibleCard = playerCard
            cpuVisibleCard = cpuCard
            playerVisibleCard = playerCard
            cpuVisibleCard = cpuCard
            return .CPU_WIN
        }
    }
    
    private func threeCardWar(playerFirstCard:Card, cpuFirstCard:Card) -> WinResult {
        // not supported yet
        if player.numberOfCards >= 2 && cpu.numberOfCards >= 2 {
            let playerHiddenCard = player.getAndRemoveFirst()!
            let cpuHiddenCard = cpu.getAndRemoveFirst()!
            
            let playerTopCard = player.getAndRemoveFirst()!
            let cpuTopCard = cpu.getAndRemoveFirst()!
            
            let winResult = fight(playerCard: playerTopCard, cpuCard: cpuTopCard)
            if winResult == WinResult.PLAYER_WIN {
                player.addCard(card: playerHiddenCard)
                player.addCard(card: cpuHiddenCard)
                player.addCard(card: playerFirstCard)
                player.addCard(card: cpuFirstCard)
                return .PLAYER_WIN
            }
            else {
                cpu.addCard(card: playerHiddenCard)
                cpu.addCard(card: cpuHiddenCard)
                cpu.addCard(card: playerFirstCard)
                cpu.addCard(card: cpuFirstCard)
                return .CPU_WIN
            }
        }
        else if (player.numberOfCards >= 2 && cpu.numberOfCards == 1)
                    || (player.numberOfCards == 1 && cpu.numberOfCards >= 2)
            || (player.numberOfCards == 1 && cpu.numberOfCards == 1)
        {
            // only 1 card played
            let playerTopCard = player.getAndRemoveFirst()!
            let cpuTopCard = cpu.getAndRemoveFirst()!
            
            let winResult = fight(playerCard: playerTopCard, cpuCard: cpuTopCard)
            if winResult == WinResult.PLAYER_WIN {
                player.addCard(card: playerFirstCard)
                player.addCard(card: cpuFirstCard)
                return .PLAYER_WIN
            }
            else {
                cpu.addCard(card: playerFirstCard)
                cpu.addCard(card: cpuFirstCard)
                return .CPU_WIN
            }
        }
        else {
            // player or cpu has 0 card in a hand
            if playerFirstCard.figure.rawValue > cpuFirstCard.figure.rawValue {
                player.addCard(card: playerFirstCard)
                player.addCard(card: cpuFirstCard)
                return .PLAYER_WIN
            }
            else if (playerFirstCard.figure.rawValue == cpuFirstCard.figure.rawValue) {
                playerVisibleCard = playerFirstCard
                cpuVisibleCard = cpuFirstCard
                return .DRAW
            }
            else {
                cpu.addCard(card: cpuFirstCard)
                cpu.addCard(card: playerFirstCard)
                return .CPU_WIN
            }
        }
    }
    
    func play() {
        if player.numberOfCards > 0 && cpu.numberOfCards > 0 {
            if let playerCard = player.getAndRemoveFirst()  {
                if let cpuCard = cpu.getAndRemoveFirst() {
                    let _ = fight(playerCard: playerCard, cpuCard: cpuCard)
                   
                  
                    if self.listener != nil && self.cpuVisibleCard != nil && self.playerVisibleCard != nil {
                        
                        self.listener!.onGame(cpuCard: cpuVisibleCard!, cpuCardLeft: cpu.numberOfCards,
                                             playerCard: playerVisibleCard!, playerCardLeft: player.numberOfCards)
                    }
                }
            }
        }
    }
}
