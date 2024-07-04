//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Glen Chen on 4/7/24.
//

import SwiftUI

struct CheckoutView: View {
    @Bindable var order: Order
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg" ), scale: 3) { image in
                        image.resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }.frame(height: 233)
                    
                    Text("Your total is \(order.cost, format: .currency(code: "SGD"))")
                        .font(.title)
                    
                    Button("place order", action: {})
                        .padding()
                }
            }
            .navigationTitle("checkout")
            .navigationBarTitleDisplayMode(.inline)
//            disable bouncing if got nth to scroll
            .scrollBounceBehavior(.basedOnSize)

        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
