package com.example.playingcard.data

class Card (val figure: CardFigure, val color: CardColor){

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as Card

        if (figure != other.figure) return false
        if (color != other.color) return false

        return true
    }

    override fun hashCode(): Int {
        var result = figure.hashCode()
        result = 31 * result + color.hashCode()
        return result
    }
}