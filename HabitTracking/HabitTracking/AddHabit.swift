//
//  AddHabit.swift
//  HabitTracking
//
//  Created by Glen Chen on 7/6/24.
//

import SwiftUI

struct AddHabit: View {
    
    @Environment(\.dismiss) var dismiss

    
    var habits: Habits
    
    @State private var name = "Sample Habit"
    @State private var description = "Sample Desc."
    @State private var count = 0

    
    var body: some View {
        NavigationStack {
            Form {
                Section("Name of Habit"){
                    TextField("Habit name:", text: $name)
                }
                
                Section("Description of Habit") {
                    TextField("Description:", text: $description)
                }
            }
            .navigationTitle("Add Habit")
            .toolbar{
                Button("Donezo") {
                    let habit = Habit(name: name, description: description, count: count)
                    habits.habitList.append(habit)
                    print("habit appended")
                    dismiss()
                    print(habits.habitList)
                }
            }
        }
    }
}

#Preview {
    AddHabit(habits: Habits())
}
