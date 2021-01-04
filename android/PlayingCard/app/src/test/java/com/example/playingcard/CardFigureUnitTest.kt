package com.example.playingcard

import com.example.playingcard.data.CardFigure
import org.junit.Test

import org.junit.Assert.*

/**
 * Example local unit test, which will execute on the development machine (host).
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
class CardFigureUnitTest {

    @Test
    fun testCardFigureValues() {
        assertEquals(2, CardFigure.TWO.figureValue)
        assertEquals(3, CardFigure.THREE.figureValue)
        assertEquals(4, CardFigure.FOUR.figureValue)
        assertEquals(5, CardFigure.FIVE.figureValue)
        assertEquals(6, CardFigure.SIX.figureValue)
        assertEquals(7, CardFigure.SEVEN.figureValue)
        assertEquals(8, CardFigure.EIGHT.figureValue)
        assertEquals(9, CardFigure.NINE.figureValue)
        assertEquals(10, CardFigure.TEN.figureValue)
        assertEquals(11, CardFigure.JACK.figureValue)
        assertEquals(12, CardFigure.QUEEN.figureValue)
        assertEquals(13, CardFigure.KING.figureValue)
        assertEquals(14, CardFigure.ACE.figureValue)
        assertEquals(15, CardFigure.JOKER.figureValue)
    }

    @Test
    fun testCardFigureLess()  {
        val allCards = CardFigure.values()
        for (index1 in allCards.indices){
            for (index2 in 0 until index1){
                val value1 = allCards[index1].figureValue
                val value2 = allCards[index2].figureValue
                assert(value2 < value1)
            }
        }

    }
}