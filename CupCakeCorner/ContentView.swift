//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Mayur on 05/08/24.
//

import SwiftUI

struct Response: Codable{
    var results: [Result]
}

struct Result: Codable{
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct ContentView: View {
    @State private var results = [Result]()
    var body: some View {
        List(results, id: \.trackId){ result in
            VStack(alignment: .leading){
                Text(result.trackName)
                    .font(.headline)
                
                Text(result.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async{
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid Url")
            return
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedData = try? JSONDecoder().decode(Response.self, from: data){
                results = decodedData.results
            }
        }catch{
            print("Not getting the data")
        }
        
    }
}

#Preview {
    ContentView()
}
