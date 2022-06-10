//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Brian Seo on 2021-06-03.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame() // Instance of Class, Pointer
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
