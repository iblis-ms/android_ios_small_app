//
//  ViewController.swift
//  PlayingCard
//
//  Created by iblis on 28/12/2020.
//

import UIKit

class ViewController: UIViewController, WarGameListener {

    @IBOutlet weak var cpuCardImage: UIImageView!
    
    @IBOutlet weak var playerCardImage: UIImageView!
    
    @IBOutlet weak var cpuCardLeftLabel: UILabel!
    
    @IBOutlet weak var playerCardLeftLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    private var warGameEngine:WarGame?
    
    @IBAction func playButtonClick(_ sender: Any) {
        print("click")
        warGameEngine!.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        warGameEngine = WarGame(self)
        warGameEngine!.restartGame()
        
    }
    
    private static func mapCardToFileName(card:Card) -> String {
        var colorStr = ""
        switch card.color {
        case .CLUBS:
        colorStr = "clubs"
        case .DAIMONDS:
            colorStr = "diamonds"
        case .HEARTS:
            colorStr = "hearts"
        case .SPADES:
            colorStr = "spades"
        }
        
        var figureStr = ""
        switch card.figure {
        case .JACK:
            figureStr = "jack"
        case .QUEEN:
            figureStr = "queen"
        case .KING:
            figureStr = "king"
        case .ACE:
            figureStr = "ace"
        case .JOKER:
            figureStr = "joker"
        case .TWO ... .TEN:
            figureStr = "\(card.figure.rawValue)"
        default:
            figureStr = ""
        }
        
        let name = "\(colorStr)_\(figureStr)"
        return name
    }
    
    func onGame(cpuCard: Card, cpuCardLeft: Int, playerCard: Card, playerCardLeft: Int) {
        cpuCardLeftLabel.text = "\(cpuCardLeft)"
        playerCardLeftLabel.text = "\(playerCardLeft)"
        
        print("cpu=\(cpuCard.color) \(cpuCard.figure)")
        print("playerCard=\(playerCard.color) \(playerCard.figure)")
        
        let cpuCardPath = ViewController.mapCardToFileName(card: cpuCard)
        let playerCardPath = ViewController.mapCardToFileName(card: playerCard)
        
        cpuCardImage.image = UIImage(named: cpuCardPath)
        playerCardImage.image = UIImage(named: playerCardPath)
        
    }
}
