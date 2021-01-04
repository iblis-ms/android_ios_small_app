package com.example.playingcard

import com.example.playingcard.data.Card
import com.example.playingcard.engine.WarEngine
import io.mockk.*
import org.junit.Test
import org.mockito.Answers
import org.mockito.Mock
import org.mockito.Mockito
import org.mockito.ArgumentCaptor

class WarEngineUnitTest {


    @Test
    fun testWarGame(){
        val mock = mockk<WarEngine.WarGameListener>()

        justRun {
            mock.onGame(any(), any(), any(), any())
        }
        val warGame = WarEngine(mock)
        warGame.restartGame()
        warGame.play()
        verify { mock.onGame(any(), any(), any(), any()) }
    }

//    private inline fun <reified T> anyObject(): T {
//
//       // val type: Class<T>  = T::class.java
//        Mockito.any<T>()
//        return uninitialized()
//    }
//
//    private fun <T> uninitialized(): T = null as T
//
//    @Test
//    fun testWarGame(){
//        val mock = Mockito.mock(WarEngine.WarGameListener::class.java) // , Answers.RETURNS_DEEP_STUBS
//
//        Mockito.doNothing().`when`(mock. onGame(
//            anyObject<Card>(), Mockito.anyInt(),
//            anyObject<Card>(), Mockito.anyInt()
//        ))
//        val warGame = WarEngine(mock)
//        warGame.restartGame()
//        warGame.play()
//
//    }

}