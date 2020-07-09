//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sophie Su on 2020-07-09.
//  Copyright © 2020 sf. All rights reserved.
//

import SwiftUI

//viewMode
class EmojiMemoryGame {

    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    //static: because before using any functions in class/struct, all the variables need to be initialized first, and we need the function to initialize the model variable
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis: Array<String> = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}
