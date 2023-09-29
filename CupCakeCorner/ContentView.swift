//
//  ContentView.swift
//  CupCakeCorner Project 10 Day49
//  @TwoStraws - Paul Hudson's 100DaysOfSwiftUI
//  Created by yannemal on 29/09/2023.
// hello

import SwiftUI
// MARK: - other class / structs
class User: ObservableObject, Codable {
    var name = "Pawel Hudsom"
}


struct ContentView: View {
// MARK: - DATA:

    var body: some View {
// MARK: - someView
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    } //end someView
// MARK: - METHODS
    
} //end struct


#Preview {
    ContentView()
}
