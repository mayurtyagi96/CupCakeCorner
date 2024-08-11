//
//  CheckOutView.swift
//  CupCakeCorner
//
//  Created by Mayur on 08/08/24.
//

import SwiftUI

struct CheckOutView: View {
    var order: Order
    
    @State private var orderMessage = ""
    @State private var showStatus = false
    
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
                    Task{
                       await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Alert", isPresented: $showStatus){
            Button("OK"){}
        } message: {
            Text("\(orderMessage)")
        }
    }
    
    func placeOrder() async{
        guard let encodedData = try? JSONEncoder().encode(order) else{
            print("Unable to encode")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        do{
            let (data, _) = try await URLSession.shared.upload(for: urlRequest, from: encodedData)
            let decodedData = try JSONDecoder().decode(Order.self, from: data)
            print(String(decoding: data, as: UTF8.self))
            orderMessage = "\(decodedData.quanity) x \(Order.types[order.type]) is on the way.."
            showStatus = true
            print("done")
        }catch{
            showStatus = true
            orderMessage = "\(error.localizedDescription)"
            print(error.localizedDescription)
        }
    }
}

#Preview {
    CheckOutView(order: Order())
}
