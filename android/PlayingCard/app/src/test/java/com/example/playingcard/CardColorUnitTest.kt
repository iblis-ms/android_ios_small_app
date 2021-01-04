package com.example.playingcard

import com.example.playingcard.data.CardColor
import com.example.playingcard.data.CardFigure
import org.junit.Test

import org.junit.Assert.*

/**
 * Example local unit test, which will execute on the development machine (host).
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
class CardColorUnitTest {
    
    @Test
    fun testCardColorValues() {
        assertEquals(0, CardColor.HEARTS.colorValue)
        assertEquals(1, CardColor.DAIMONDS.colorValue)
        assertEquals(2, CardColor.CLUBS.colorValue)
        assertEquals(3, CardColor.SPADES.colorValue)
    }

    @Test
    fun testCardColorLess()  {
        val allCards = CardColor.values()
        for (index1 in allCards.indices){
            for (index2 in 0 until index1){
                val value1 = allCards[index1].colorValue
                val value2 = allCards[index2].colorValue
                assert(value2 < value1)
            }
        }

    }
}