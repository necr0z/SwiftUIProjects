import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @State private var poorDog = false
    
    @FocusState private var amountIsFocused: Bool

    
    let tipPercentages = [0, 10, 15, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var totalPlusTip: Double {
        return checkAmount + (checkAmount / 100 * Double(tipPercentage))
    }
    
    
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad).focused($amountIsFocused)

                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0)")
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section("How much tip do you want to leave?") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id:\.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                        .onChange(of: tipPercentage){
                            if (tipPercentage == 0) {
                                poorDog = true
                            }
                            else {
                                poorDog = false
                            }
                        }
                }
                
//                Section("How much tip do you want to leave?") {
//                    Picker("Tip Percentage", selection: $tipPercentage) {
//                        ForEach(1..<101) {
//                            Text($0, format: .percent)
//                        }
//                    }
//                }
                
                
                Section("Total Amount + Tip") {
                    Text(totalPlusTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }.foregroundStyle(poorDog ? .red : .black)
            }
            .navigationTitle("do a lil splittin")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
