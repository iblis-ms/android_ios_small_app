package com.example.playingcard.engine

import com.example.playingcard.data.Card
import com.example.playingcard.data.CardColor
import com.example.playingcard.data.CardFigure
import com.example.playingcard.data.PlayerData
import kotlin.random.Random

class WarEngine{
    interface WarGameListener {
        fun onGame(cpuCard:Card, cpuCardLeft:Int, playerCard:Card, playerCardLeft:Int)
    }

    private var player = PlayerData()
    private var cpu = PlayerData()
    private var cards = ArrayList<Card>()

    private val listener:WarGameListener
    private var playerVisibleCard:Card? = null
    private var cpuVisibleCard:Card? = null


    constructor(listener:WarGameListener)  {
        this.listener = listener

        for (color in CardColor.values()){
            for (figure in CardFigure.values()){
                cards.add(Card(figure, color))
            }
        }
    }

    fun restartGame(){
        for (card in cards) {
            if (card.figure != CardFigure.JOKER) {
                if (Random.nextInt(0, 2) == 0){
                    player.addCard(card)
                }
                else {
                    cpu.addCard(card)
                }
            }
        }
    }


    private enum class WinResult {
        PLAYER_WIN,
        CPU_WIN,
        DRAW
    }


    private fun fight(playerCard:Card, cpuCard:Card) : WinResult{
        if (playerCard.figure.figureValue > cpuCard.figure.figureValue) {
            player.addCard(playerCard)
            player.addCard(cpuCard)
            playerVisibleCard = playerCard
            cpuVisibleCard = cpuCard
            playerVisibleCard = playerCard
            cpuVisibleCard = cpuCard
            return WinResult.PLAYER_WIN
        }
        else if (playerCard.figure.figureValue == cpuCard.figure.figureValue) {
            return threeCardWar(playerCard, cpuCard)
        }
        else {
            cpu.addCard(cpuCard)
            cpu.addCard(playerCard)
            playerVisibleCard = playerCard
            cpuVisibleCard = cpuCard
            playerVisibleCard = playerCard
            cpuVisibleCard = cpuCard
            return WinResult.CPU_WIN
        }
    }

    private fun threeCardWar(playerFirstCard:Card, cpuFirstCard:Card) : WinResult {
        // not supported yet
        if (player.numberOfCards >= 2 && cpu.numberOfCards >= 2) {
            val playerHiddenCard = player.getAndRemoveFirst()!!
            val cpuHiddenCard = cpu.getAndRemoveFirst()!!

            val playerTopCard = player.getAndRemoveFirst()!!
            val cpuTopCard = cpu.getAndRemoveFirst()!!

            val winResult = fight(playerTopCard, cpuTopCard)
            if (winResult == WinResult.PLAYER_WIN) {
                player.addCard(playerHiddenCard)
                player.addCard(cpuHiddenCard)
                player.addCard(playerFirstCard)
                player.addCard(cpuFirstCard)
                return WinResult.PLAYER_WIN
            }
            else {
                cpu.addCard(playerHiddenCard)
                cpu.addCard(cpuHiddenCard)
                cpu.addCard(playerFirstCard)
                cpu.addCard(cpuFirstCard)
                return WinResult.CPU_WIN
            }
        }
        else if ((player.numberOfCards >= 2 && cpu.numberOfCards == 1)
                || (player.numberOfCards == 1 && cpu.numberOfCards >= 2)
                || (player.numberOfCards == 1 && cpu.numberOfCards == 1))
        {
            // only 1 card played
            val playerTopCard = player.getAndRemoveFirst()!!
            val cpuTopCard = cpu.getAndRemoveFirst()!!

            val winResult = fight(playerTopCard, cpuTopCard)
            if (winResult == WinResult.PLAYER_WIN) {
                player.addCard(playerFirstCard)
                player.addCard(cpuFirstCard)
                return WinResult.PLAYER_WIN
            }
            else {
                cpu.addCard(playerFirstCard)
                cpu.addCard(cpuFirstCard)
                return WinResult.CPU_WIN
            }
        }
        else {
            // player or cpu has 0 card in a hand
            if (playerFirstCard.figure.figureValue > cpuFirstCard.figure.figureValue) {
                player.addCard(playerFirstCard)
                player.addCard(cpuFirstCard)
                return WinResult.PLAYER_WIN
            }
            else if (playerFirstCard.figure.figureValue == cpuFirstCard.figure.figureValue) {
                playerVisibleCard = playerFirstCard
                cpuVisibleCard = cpuFirstCard
                return WinResult.DRAW
            }
            else {
                cpu.addCard(cpuFirstCard)
                cpu.addCard(playerFirstCard)
                return WinResult.CPU_WIN
            }
        }
    }

    fun play() {
        if (player.numberOfCards > 0 && cpu.numberOfCards > 0) {
            val playerCard = player.getAndRemoveFirst()!!
            val cpuCard = cpu.getAndRemoveFirst()!!
            fight(playerCard, cpuCard)


            if (this.listener != null && this.cpuVisibleCard != null && this.playerVisibleCard != null) {

                this.listener.onGame(
                    this.cpuVisibleCard!!, cpu.numberOfCards,
                    this.playerVisibleCard!!, player.numberOfCards)


            }
        }
    }
}