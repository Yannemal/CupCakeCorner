//
//  ContentView.swift
//  CupCakeCorner Project 10 Day49
//  @TwoStraws - Paul Hudson's 100DaysOfSwiftUI
//  Created by yannemal on 29/09/2023.
//

import SwiftUI
// MARK: - other class / structs


struct ContentView: View {
// MARK: - DATA:
    @StateObject var order = Order()
    // ⬆️ this one creates it all other views reference this one.
    var currentPick : String {
        let selectedType = Order.types[order.type]
        return selectedType
    }

    var body: some View {
        // MARK: - someView
        NavigationStack {
            Section {
                Picker("Select your CupCake", selection: $order.type) {
                    ForEach(Order.types.indices) {
                        Text(Order.types[$0])
                    }
                }
                
                Stepper("Number of \(currentPick) CupCakes: \(order.quantity)", value: $order.quantity, in: 1...20)
            }
            
            Section {
                Toggle("Any special requests ?", isOn: $order.specialRequestEnabled.animation())
                
                if order.specialRequestEnabled {
                    Section {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add sprinkles", isOn: $order.addSprinkles)
                    } header: {
                        Text("adds 10 pesos per CupCake for sprinkles \nand 20 pesos for frosting per CupCake")
                            .foregroundStyle(.gray)
                    }
                }
            }
            
            Section {
                NavigationLink {
                    AddressView(order: order)
                } label: {
                    Text("Delivery details")
                }
                
            }
            
            
        }
        .navigationTitle("CupCake Corner")
        .listStyle(.grouped)
        .padding(10)
        
    } //end someView
// MARK: - METHODS
  
    
} //end struct


#Preview {
    ContentView()
}
