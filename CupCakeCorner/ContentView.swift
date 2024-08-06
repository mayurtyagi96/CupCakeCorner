//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Mayur on 05/08/24.
//

import SwiftUI

@Observable
class User: Codable{
    enum CodingKeys: String, CodingKey{
        case _name = "name"
    }
    var name: String = "Mayur"
}

struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        Button("Encode",action: encodeData)
            .font(.title)
    }
    
    func encodeData(){
        let data = try! JSONEncoder().encode(user)
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    ContentView()
}
