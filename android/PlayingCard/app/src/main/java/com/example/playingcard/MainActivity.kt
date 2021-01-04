package com.example.playingcard

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import com.example.playingcard.data.Card
import com.example.playingcard.data.CardColor
import com.example.playingcard.databinding.ActivityMainBinding
import com.example.playingcard.engine.WarEngine

class MainActivity : AppCompatActivity(), WarEngine.WarGameListener{

    private var  warEngine:WarEngine = WarEngine(this)
    private lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        warEngine.restartGame()

        binding.playButton.setOnClickListener {
            Log.v("PlayCards", "Click")
            warEngine.play()
        }

    }

    private  fun mapCardId(card:Card) : Int {

        val name = "${card.color.colorTxt}_${card.figure.figureTxt}"
        val id = resources.getIdentifier(
            name,
            "drawable",
        packageName)
        Log.v("PlayerCards", "name=${name} id = ${id}")
        return id
    }
    override fun onGame(cpuCard: Card, cpuCardLeft: Int, playerCard: Card, playerCardLeft: Int){

        binding.playerCardsLeft.text = "$playerCardLeft"
        binding.cpuCardsLeft.text = "$cpuCardLeft"

        val cpuCardResId = mapCardId(cpuCard)
        val playerCardResId = mapCardId(playerCard)
        binding.cpuCardView.setImageResource(cpuCardResId)
        binding.playerCardView.setImageResource(playerCardResId)

    }
}