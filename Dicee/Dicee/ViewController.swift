//
//  ViewController.swift
//  Dicee
//
//  Created by 谢庭宇 on 2021/8/11.
//

import UIKit

class ViewController: UIViewController {
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    
    var index1: Int = 0
    var index2: Int = 0

    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBAction func rollbuttion(_ sender: Any) {
        updateDiceImages()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDiceImages()
    }
    
    func updateDiceImages() {
        index1 = Int.random(in: 0...5)
        index2 = Int.random(in: 1...6)
        
        diceImageView.image = UIImage(named: diceArray[index1])
        diceImageView2.image = UIImage(named: "dice\(index2)")
    }


}

