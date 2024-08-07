//
//  AddressView.swift
//  CupCakeCorner
//
//  Created by Mayur  on 07/08/24.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    var body: some View {
        Form{
            Section{
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip Code", text: $order.zipCode)
            }
            
            Section{
                NavigationLink("Checkout", destination: CheckOutView(order: order))
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Address")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
