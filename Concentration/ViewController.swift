//
//  ViewController.swift
//  Concentration
//
//  Created by Yaohua Sun on 9/4/18.
//  Copyright © 2018 ChinaAdventureDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojiChoices = ["🎃","👻","🎃","👻"]
    
    @IBOutlet var cardButtons: [UIButton]!
    // _ is the external name, sender is the internal name
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender)
        {
            //print ("cardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        else
        {
            print ("chosen card was not in CardButton")
        }
        
        //flipCountLabel.text = "Flips: \(flipCount)"
        //print("agh! a ghost!")
        //flipCard(withEmoji: "👻", on: sender)
        
    }
    
    //@IBAction func touchSecondCard(_ sender: UIButton) {
     //   flipCount += 1
    //    //flipCountLabel.text = "Flips: \(flipCount)"
    //    flipCard(withEmoji: "🎃", on: sender)
    //}
    func flipCard(withEmoji emoji:String, on button: UIButton){
        //print("flipCard (withEmoji: \(emoji))")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji,for:UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    

}

