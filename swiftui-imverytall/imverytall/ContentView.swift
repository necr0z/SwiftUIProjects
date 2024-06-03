import SwiftUI
import Foundation

struct ContentView: View {
    @State private var inputHeight: Double = 0.0
    @FocusState private var focus: Bool
    var outputHeight: Double {
        return inputHeight / 30.48
    }
    var kek: Double {
        let x = inputHeight * 10 / 30.48
        let y = ceil(x)
        let z = y / 10
        return z
    }
    var kekw: Character {
        return String(kek).first!
    }
    
    

    var body: some View {
        NavigationStack {
            Form {
                Section("Enter height in fucking centimetres") {
                    TextField("Enter Height", value: $inputHeight, formatter: NumberFormatter()).keyboardType(.decimalPad).focused($focus)
                }
                Section("Your non-human readable result"){
                    Text(String(outputHeight))
                }
                Section("Your result rounded up smile") {
                    Text("\(String(kek).first!)' \(String(kek).last!)\"")
                }
                if (inputHeight <= 179) {
                    Text("Short fuck")
                } else {
                    Text("Tall fuck we cool")
                }
                
            }
            .navigationTitle("Do a little convertin'")
            .toolbar {
                if focus {
                    Button("Done") {
                        focus.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
