//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Mayur on 05/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userName = ""
    @State private var email = ""
    
    var isValid: Bool{
        userName.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form{
            Section{
                TextField("enter name", text: $userName)
                TextField("enter email", text: $email)
            }
            
            Section{
                Button("Create account"){
                    print("account created")
                }
                .disabled(isValid)
            }
        }
    }
}

#Preview {
    ContentView()
}
