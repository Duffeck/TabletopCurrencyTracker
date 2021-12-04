//
//  CalculatorView.swift
//  TeabletopCurrencyTracker
//
//  Created by user204084 on 12/1/21.
//

import SwiftUI

struct CalculatorView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var player: Player
    @State private var calculatorText = "0"
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack() {
            Spacer()
            HStack{
                Text("\(String(player.currentCurrency))")
                
                TextField("0", text: $calculatorText)
                    .padding()
                    .border(Color.gray, width: 2)
                    .multilineTextAlignment(.trailing)
                
                Button(action: {
                    calculatorText = "0"
                }) {
                    (Text("CE"))
                }
            }.padding()
            Spacer()
            HStack {
                createCalcDigit("1")
                Spacer()
                createCalcDigit("2")
                Spacer()
                createCalcDigit("3")
            }.padding()
            
            HStack {
                createCalcDigit("4")
                Spacer()
                createCalcDigit("5")
                Spacer()
                createCalcDigit("6")
            }.padding()
            
            HStack {
                createCalcDigit("7")
                Spacer()
                createCalcDigit("8")
                Spacer()
                createCalcDigit("9")
            }.padding()
            
            HStack {
                Button(action: {
                    self.operandTapped("-")
                }) {
                    (Text("-"))
                }
                Spacer()
                createCalcDigit("0")
                Spacer()
                Button(action: {
                    self.operandTapped("+")
                }) {
                    (Text("+"))
                }
                
            }.padding()
            Spacer()
        }
        .font(.largeTitle)
    }
    
    private func createCalcDigit(_ number: String) -> Button<Text> {
        return Button(action: {
            self.digitTapped(number)
        }) {
            (Text(number))
        }
    }
    
    private func digitTapped(_ number: String) -> Void {
        if calculatorText == "0" {
            calculatorText = number
        } else {
            calculatorText += number
        }
    }
    
    private func operandTapped(_ operand: String) {
        let value = Int(calculatorText) ?? 0
        if operand == "-" {
            player.currentCurrency-=value
            player.currencyHistory.append(-value)
            self.presentationMode.wrappedValue.dismiss()
        } else if operand == "+" {
            player.currentCurrency+=value
            player.currencyHistory.append(value)
            self.presentationMode.wrappedValue.dismiss()
        }
        
    }
}

struct CalculatorView_Previews: PreviewProvider {
    @State static var value = true
    @State static var player = Player()
    static var previews: some View {
        CalculatorView(player: self.$player, isShowing: self.$value)
    }
}
