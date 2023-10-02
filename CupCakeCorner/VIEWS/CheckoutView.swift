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
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
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
                    
                    Button("Place Order")  {
                        
                        Task {
                            await placeOrder()
                        }
                    }
                        .padding()
                }
            }
        }
        .navigationTitle("CheckOut")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank You for your order", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
         Text(confirmationMessage)
        }
    }
    
// MARK: - METHODS:
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        // this is a test site that mirrors what it sends back just to test code
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        // make network request:
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            // handle result:

            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your Order \(decodedOrder.quantity) * \(Order.types[decodedOrder.type].lowercased()) has been received"
            showingConfirmation = true
            
        } catch {
            print("checkout failed")
        }
    }
    
    
}

#Preview {
    CheckoutView(order: Order())
}
