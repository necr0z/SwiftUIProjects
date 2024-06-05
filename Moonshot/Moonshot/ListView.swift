import SwiftUI

struct ListView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(missions) { mission in
                    
//                    same as gridview.swift, refactor for challenge 9
                    NavigationLink(value: mission) {
                    
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(.darkBackground)
                        .cornerRadius(10)
                    }
                    .listRowBackground(Color.darkBackground)
                }
            }
            .scrollContentBackground(.hidden) // Hide default list background
            //        the above most impt
            
            
            .background(.darkBackground)
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            
            .navigationDestination(for: Mission.self) { mission in
                            MissionView(mission: mission, astronauts: astronauts)
                        }        }
    }
}

#Preview {
    ListView()
}
