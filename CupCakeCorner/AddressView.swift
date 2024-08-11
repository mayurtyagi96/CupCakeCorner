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
                TextField("Name", text: $order.address.name)
                TextField("Street Address", text: $order.address.streetAddress)
                TextField("City", text: $order.address.city)
                TextField("Zip Code", text: $order.address.zipCode)
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
