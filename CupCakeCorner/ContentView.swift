//
//  ContentView.swift
//  CupCakeCorner Project 10 Day49
//  @TwoStraws - Paul Hudson's 100DaysOfSwiftUI
//  Created by yannemal on 29/09/2023.
// hello

import SwiftUI
// MARK: - other class / structs
class User: ObservableObject, Codable {

    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Yann Guyt "
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
    
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
