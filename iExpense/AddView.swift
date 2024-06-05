//
//  AddView.swift
//  iExpense
//
//  Created by Glen Chen on 28/5/24.
//



import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss

    var expenses: Expenses

    @State private var name = "Expense Name"
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    let types = ["Bizness", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                
//                Changed to nav title bar after challenge 2
                
//                TextField("Expense name", text:$name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id:\.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value:$amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }            
            
            
        .navigationTitle($name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            Button("Save") {
                if validateInputs(){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Invalid input"), message: Text(alertMessage), dismissButton: .default(Text("OK boy")))
        })

        }
    }
    
    private func validateInputs() -> Bool {
        if name.isEmpty || name == "Expense Name" {
            alertMessage = "Please enter a name for the expense."
            showAlert = true
            return false
        }
        
        if amount <= 0 {
            alertMessage = "Please enter a valid amount greater than 0."
            showAlert = true
            return false
        }
        
        return true
    }
}

#Preview {
    AddView(expenses: Expenses())
}
