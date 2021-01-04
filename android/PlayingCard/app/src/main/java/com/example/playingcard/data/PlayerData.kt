package com.example.playingcard.data

import kotlin.properties.Delegates

class PlayerData {
    private var cards = ArrayList<Card>()

    val numberOfCards:Int  get(){
        return cards.size
    }

    fun addCard(card: Card){
        cards.add(card)
    }

    fun getAndRemoveFirst() : Card? {

        if (cards.isEmpty()) {
            return null
        }

        val card = cards[0]
        cards.remove(card)
        return card
    }
}