import SwiftUI

struct ListView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
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
    }
}

#Preview {
    ListView()
}
