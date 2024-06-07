//  At the very least, this means there should be a list of all activities they want to track, plus a form to add new activities – a title and description should be enough.

//For a bigger challenge, tapping one of the activities should show a detail screen with the description. For a tough challenge – see the hints below! – make that detail screen contain how many times they have completed it, plus a button incrementing their completion count.

//And if you want to make the app really useful, use Codable and UserDefaults to load and save all your data.


import SwiftUI
import Observation


struct Habit: Identifiable, Codable, Hashable {
    
    var id = UUID()
    let name: String
    let description: String
    let count: Int
    
}

@Observable
class Habits {
    var habitList = [Habit]()
    init() {
        habitList = []
    }
}


struct ContentView: View {
    @State private var habits = Habits()
  //  instance of the class
    
    @State private var showAddHabit = false
    
    
    
    var body: some View {
        NavigationStack{
            List{
                Section("Habits"){
                    ForEach(habits.habitList){habit in
                        HStack {
                            VStack{
                                Text(habit.name)
                                    .font(.headline)
                                Text(habit.description)
                                    .foregroundStyle(.gray)

                            }
                            Spacer()
                            Text("\(habit.count)")
                                .font(.body)
                                .foregroundStyle(.secondary)
                        }
                        
                        
                    }
                }
            }
            
            
            .navigationTitle("casual habit tracker")
            .sheet(isPresented: $showAddHabit) {
                AddHabit(habits: habits)
            }
            .toolbar {
                Button("Add habit") {
                    showAddHabit.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
