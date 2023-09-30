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
    
    var body: some View {
        // MARK: - someView
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                      Image(systemName: "arrow.down.message.fill")
                            .scaleEffect(4.0)
                            .foregroundColor(.red)
        } else {
            ProgressView()
          }
        }
        .frame(width: 200, height: 200)
          
      
    } //end someView
// MARK: - METHODS
    
    
} //end struct


#Preview {
    ContentView()
}
