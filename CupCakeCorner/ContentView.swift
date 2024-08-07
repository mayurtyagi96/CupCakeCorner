//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Mayur on 05/08/24.
//
import CoreHaptics
import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    
    var body: some View{
        NavigationStack{
            Form{
                Section{
                    Picker("Select Cake type", selection: $order.type){
                        ForEach(Order.types.indices, id: \.self){
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quanity)", value: $order.quanity, in: 1...20)
                }
                
                Section{
                    Toggle("Any special request", isOn: $order.specialRequestEnabled.animation())
                    if order.specialRequestEnabled{
                        Toggle("Extra Sprinkles", isOn: $order.addSprinkles)
                        Toggle("Exrta Frostings", isOn: $order.extraFrostings)
                    }
                }
                
                Section{
                   NavigationLink("Delivey Details", destination: AddressView(order: order))
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
