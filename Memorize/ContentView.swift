//
//  ContentView.swift
//  Memorize
//
//  Created by Sophie Su on 2020-07-09.
//  Copyright © 2020 sf. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill().foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
        .font(Font.system(size: min(size.width, size.height) * 0.75))
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //just for testing, so can create viewModels on the fly
        ContentView(viewModel: EmojiMemoryGame())
    }
}
