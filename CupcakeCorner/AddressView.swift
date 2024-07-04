//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Glen Chen on 4/7/24.
//

import SwiftUI

struct AddressView: View {
    
    
    @Bindable var order: Order
    var body: some View {
        NavigationStack{
            Section {
                TextField("Name", text: $order.name)
                TextField("Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zipcode", text: $order.zip
                )
            }
            Section {
                NavigationLink("Checkout"){
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
            .navigationTitle("Delivery Address")
            .navigationBarTitleDisplayMode(.inline)

        }
    }
    
    
}

#Preview {
    AddressView(order: Order())
}
