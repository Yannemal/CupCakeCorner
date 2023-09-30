//
//  ContentView.swift
//  CupCakeCorner Project 10 Day49
//  @TwoStraws - Paul Hudson's 100DaysOfSwiftUI
//  Created by yannemal on 29/09/2023.
//

import SwiftUI
// MARK: - other class / structs

struct Response : Codable {
    var results : [Result]
}

struct Result : Codable {
    var trackID : Int
    var trackName : String
    var collectionName : String
}

struct ContentView: View {
// MARK: - DATA:
    @State private var results = [Result]()

    var body: some View {
// MARK: - someView
   
        List(results, id: \.trackID) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
        
    } //end someView
// MARK: - METHODS
    
    func loadData() async {
        guard let url = URL(string: /* API call */ "https://itunes.apple.com/search?term=taylor+swift&entity=song") else 
        {
            print("invalid URL")
            return
        }
        // a sleep might occur an error might occur
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("invalid Data")
        }
    }
    
} //end struct


#Preview {
    ContentView()
}
