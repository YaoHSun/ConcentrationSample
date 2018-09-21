//
//  Card.swift
//  Concentration
//
//  Created by Yaohua Sun on 9/20/18.
//  Copyright © 2018 ChinaAdventureDev. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    //init(identifier : Int){
     //   self.identifier = identifier
    //}
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
