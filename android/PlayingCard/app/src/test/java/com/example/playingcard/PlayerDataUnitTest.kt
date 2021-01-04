package com.example.playingcard;

import com.example.playingcard.data.PlayerData;
import com.example.playingcard.data.Card;
import com.example.playingcard.data.CardColor;
import com.example.playingcard.data.CardFigure;

import org.junit.Test;

import org.junit.Assert.*;

 class PlayerDataUnitTest {

     @Test
     fun testEmptyPlayer() {
         var playerData = PlayerData();

         val card = playerData.getAndRemoveFirst()
         assertNull(card)
         assertEquals(0, playerData.numberOfCards)
     }

     @Test
     fun testOneCardPlayer() {

         val playerData = PlayerData()
         val card = Card(CardFigure.ACE, CardColor.CLUBS)
         playerData.addCard(card)

         assertEquals(1, playerData.numberOfCards)

         val actualCard= playerData.getAndRemoveFirst()
         assertNotNull(actualCard)
         assertEquals(0, playerData.numberOfCards)

         assertEquals(card, actualCard)

         val cardAfterRemovingAllCards = playerData.getAndRemoveFirst()
         assertNull(cardAfterRemovingAllCards)
         assertEquals(0, playerData.numberOfCards)
     }

     @Test
     fun testManyCars()  {

         val playerData = PlayerData()
         val cards = arrayOf(
             Card(CardFigure.ACE, CardColor.CLUBS),
            Card(CardFigure.JACK, CardColor.HEARTS),
            Card(CardFigure.TWO, CardColor.DAIMONDS),
            Card(CardFigure.FIVE, CardColor.SPADES),
         )

         cards.forEach {
             playerData.addCard(it)
         }
         assertEquals(cards.size, playerData.numberOfCards)

         for (counter in cards.indices) {
             val actualCard = playerData.getAndRemoveFirst()
             assertEquals(cards[counter], actualCard)
         }

         val cardAfterRemovingAllCards = playerData.getAndRemoveFirst()
         assertNull(cardAfterRemovingAllCards)
         assertEquals(0, playerData.numberOfCards)

     }
 }