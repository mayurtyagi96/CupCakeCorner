//
//  CheckOutView.swift
//  CupCakeCorner
//
//  Created by Mayur on 08/08/24.
//

import SwiftUI

struct CheckOutView: View {
    var order: Order
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3){ image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "INR"))")
                    .font(.title)
                
                Button("Place Order"){
                    print("order placed")
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        
    }
}

#Preview {
    CheckOutView(order: Order())
}
