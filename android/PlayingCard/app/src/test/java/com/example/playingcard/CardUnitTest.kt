package com.example.playingcard

import com.example.playingcard.data.Card
import com.example.playingcard.data.CardColor
import com.example.playingcard.data.CardFigure
import org.junit.Assert
import org.junit.Test

class CardUnitTest {

    @Test
    fun testCardColorLess()  {
        val card1 = Card(CardFigure.THREE, CardColor.HEARTS)
        val card2 = Card(CardFigure.THREE, CardColor.HEARTS)
        val cardDifferent1 = Card(CardFigure.KING, CardColor.HEARTS)
        val cardDifferent2 = Card(CardFigure.THREE, CardColor.CLUBS)
        val cardDifferent3 = Card(CardFigure.SIX, CardColor.CLUBS)

        Assert.assertEquals(card1, card2)
        Assert.assertNotEquals(card1, cardDifferent1)
        Assert.assertNotEquals(card1, cardDifferent2)
        Assert.assertNotEquals(card1, cardDifferent3)

    }
}