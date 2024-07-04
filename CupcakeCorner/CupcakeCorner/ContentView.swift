
import SwiftUI
import CoreHaptics



struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Select cake type", selection: $order.type){
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                    
                }
                Section{
                    Toggle("Any special things?", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled {
                        Toggle("extra frosting", isOn:$order.extraFrosting)
                        Toggle("add sprinkles", isOn:$order.addSprinkles)
                    }
                }
                Section{
                    NavigationLink("deliery details"){
                        AddressView(order: Order())
                    }
                }
            }
            
            
            
            .navigationTitle("Cupcake Corner")
        }
    }
}
