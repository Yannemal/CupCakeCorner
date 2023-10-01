//
//  AddressView.swift
//  CupCakeCorner Project 10 Day49
//  @TwoStraws - Paul Hudson's 100DaysOfSwiftUI
//  Created by yannemal on 29/09/2023.
//

import SwiftUI

struct AddressView: View {
    // MARK: - DATA:
    @ObservedObject var order: Order
    //⬆️ make space for the reference to the instance of the class
    
    var body: some View {
        // MARK: - someView:
        NavigationStack {
            Form {
                TextField("name", text: $order.name)
                TextField("street", text: $order.streetAddress)
                TextField("postcode", text: $order.zip)
                TextField("place", text: $order.city)
                
            }
            // placed by accident outside the form and it shows up on the bottom
            if order.name.count < 2 || order.streetAddress.count < 3 || order.city.count < 3 {
                Section {
                  Text("""
Check Out

""")
                        .foregroundStyle(.gray)
                }
            } else if
                order.name.count > 2 && order.streetAddress.count > 3 && order.city.count > 3 {
                Section {
                    NavigationLink {
                        CheckoutView(order: order)
                    } label: {
                        Text("""
Check Out


""")
                       
                    }
                
                    .bold()
                   
                }
            }
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
    // MARK: - METHODS:
}

#Preview {
    AddressView(order:Order())
}
