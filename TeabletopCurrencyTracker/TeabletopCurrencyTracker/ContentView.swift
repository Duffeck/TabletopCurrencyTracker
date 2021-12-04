//
//  ContentView.swift
//  TeabletopCurrencyTracker
//
//  Created by user204084 on 11/20/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let player_1 = Player(name: "player_1", currentCurrency: 50, currencyHistory: [])
        let player_2 = Player(name: "player_2", currentCurrency: 50, currencyHistory: [])
        
        VStack{
            PlayerView(player:player_2).rotationEffect(.degrees(-180))
            
            PlayerView(player:player_1).rotationEffect(.degrees(-360))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
