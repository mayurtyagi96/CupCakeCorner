//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Mayur on 05/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){ phase in
            if let image = phase.image{
                image
                    .resizable()
                    .scaledToFit()
            }else if phase.error != nil{
                Text("There is an error")
            }else{
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ContentView()
}
