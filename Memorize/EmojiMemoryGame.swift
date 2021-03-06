//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Cathy Chen on 2022-06-09.
// ViewModel

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    static var themes: Array<Theme> = [Theme(name: "Fruit", myEmojis: ["🍏", "🍎", "🍊","🍇", "🍓",
                                                                "🍋","🍑","🥭","🍍","🥥",
                                                                "🥝", "🍅", "🍆", "🥑", "🥦",
                                                                       "🥬", "🥒"], colour: CGColor(red: 0.85, green: 0.2, blue: 0.2, alpha: 1)),
                                Theme(name: "Car", myEmojis: ["🚗", "🚕", "🚙", "🚌", "🚎",
                                                              "🏎", "🚓", "🚑", "🚒", "🚐",
                                                              "🛻", "🚚","🚛", "🚜", "🛵"], colour: CGColor(red: 0.2, green: 0.3, blue: 0.8, alpha: 1))]
    static var currentTheme = themes[Int.random(in: 0..<2)]
    
    //Function to populate card content for the game
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: currentTheme.numOfPair ) { pairIndex in
            currentTheme.myEmojis[pairIndex] //Content of the card
        }
    }
        
    //Automatically update the model
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    //Retrieve the array of cards for the game
    var cards: Array<Card> {
        return model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: Card) {
        return model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func getScore() -> Int {
        return model.score
    }
    
    func startNewGame(){
        EmojiMemoryGame.currentTheme = EmojiMemoryGame.themes[Int.random(in: 0..<2)]
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}

