//
//  CheckoutView.swift
//  CupCakeCorner Project 10 Day49
//  @TwoStraws - Paul Hudson's 100DaysOfSwiftUI
//  Created by yannemal on 29/09/2023.
//

import SwiftUI

struct CheckoutView: View {
    // MARK: - DATA
    @ObservedObject var order: Order
    
    var body: some View {
        // MARK: - someVIEW:
        NavigationStack {
           
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 233)
                    //to stop the spinner from jumping..
                    
                    Text("Your total is \(order.cost, format: .currency(code: "PHP")) ")
                        .font(.title)
                    
                    Button("Place Order", action: {/* code */ })
                        .padding()
                }
            }
        }
        .navigationTitle("CheckOut")
        .navigationBarTitleDisplayMode(.inline)
    }
    
// MARK: - METHODS:
    
}

#Preview {
    CheckoutView(order: Order())
}
