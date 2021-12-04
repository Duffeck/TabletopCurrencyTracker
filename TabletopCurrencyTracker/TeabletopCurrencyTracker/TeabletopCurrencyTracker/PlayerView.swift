//
//  PlayerView.swift
//  TeabletopCurrencyTracker
//
//  Created by user204084 on 12/1/21.
//

import SwiftUI

struct PlayerView: View {
    @State var showingModal: Bool = false
    @State var player: Player
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    Button(action: {
                        self.showingModal.toggle()
                    }) {
                        Text("H")
                    }.sheet(isPresented: $showingModal) {
                        CalculatorView(
                            player: self.$player,
                            isShowing: self.$showingModal)
                    }
                    Button("-") {
                        player.currentCurrency-=1
                        player.currencyHistory.append(-1)
                        
                    }.padding().border(Color.green)
                }
                Text("\(player.currentCurrency)").font(.system(size: 78)).padding().border(Color.green);
                VStack {
                    Button(action: {
                        self.showingModal.toggle()
                    }) {
                        Text("C")
                    }.sheet(isPresented: $showingModal) {
                        CalculatorView(
                            player: self.$player,
                            isShowing: self.$showingModal)
                    }.padding().border(Color.green)
                    Button("+") {
                        player.currentCurrency+=1
                        player.currencyHistory.append(1)
                        
                    }.padding().border(Color.green)
                }
            }.border(Color.red);
        }}
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(player: Player())
    }
}
