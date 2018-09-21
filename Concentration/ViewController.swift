//
//  ViewController.swift
//  Concentration
//
//  Created by Yaohua Sun on 9/4/18.
//  Copyright © 2018 ChinaAdventureDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // class get a free init without arguments if all
    // its vars are initialized
    
    // lazy var doesn't get initialized until someone uses it ; can't use property observers with lazy vars
    lazy var game = Concentration (numberOfPairsOfCards:
        (cardButtons.count+1) / 2)
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
    

    
    @IBOutlet var cardButtons: [UIButton]!
    // _ is the external name, sender is the internal name
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender)
        {
            //print ("cardNumber = \(cardNumber)")
           // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else
        {
            print ("chosen card was not in CardButton")
        }
        
        //flipCountLabel.text = "Flips: \(flipCount)"
        //print("agh! a ghost!")
        //flipCard(withEmoji: "👻", on: sender)
        
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for:card),for:UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0):#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["😱","🦇","🎃","👻","🐯","🦊","🐻","🐼","🦍"]
    
    // what's in the dictionary might be optional
    //var emoji = Dictionary<Int, String>()
    var emoji = [Int:String]()
    
    func emoji(for card:Card) -> String{
        //let chosenEmoji = emoji[card.identifier]
        
        /*if emoji[card.identifier] != nil {
            return emoji[card.identifier]!
        } else {
            return "?"
        }*/
        
 
        /*if emoji[card.identifier] == nil {
            if emojiChoices.count>0{
                // swift never does automatic type conversion
                
                // index into an array is Int type , not UInt32 type
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at:randomIndex)
            }

        }*/
        // back to back ifs as above could be combined with comma
        if emoji[card.identifier] == nil,emojiChoices.count>0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at:randomIndex)
        }
        
        
        return emoji[card.identifier] ?? "?"
    }
    
    //@IBAction func touchSecondCard(_ sender: UIButton) {
     //   flipCount += 1
    //    //flipCountLabel.text = "Flips: \(flipCount)"
    //    flipCard(withEmoji: "🎃", on: sender)
    //}
    /*func flipCard(withEmoji emoji:String, on button: UIButton){
        //print("flipCard (withEmoji: \(emoji))")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji,for:UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }*/
    
    
    

}

