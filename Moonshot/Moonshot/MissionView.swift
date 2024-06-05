//
//  MissionView.swift
//  Moonshot
//
//  Created by Glen Chen on 31/5/24.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember: Hashable {
        let role: String
        let astronaut: Astronaut
    }
    let mission: Mission
    
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {width, axis in width * 0.6}
                
                VStack(alignment: .leading){
                    
                    RectangleDividerView()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text("Launch Date: \(mission.formattedLaunchDate)").font(.title3).foregroundStyle(.gray).padding(.bottom, 3)
                    
                    Text(mission.description)
                    
                    RectangleDividerView()
                    
                    Text("Crew")
                        .font(.title.bold())
                    
                }
                .padding(.horizontal)
                
                AstronautHorizontalScrollView(crew: crew)
                
//                ScrollView(.horizontal, showsIndicators: false){
//                    HStack {
//                        ForEach(crew, id:\.role ) { crewMember in
//                            NavigationLink { AstronautView(astronaut: crewMember.astronaut)
//                            } label: {
//                                HStack {
//                                    Image(crewMember.astronaut.id)
//                                        .resizable()
//                                        .frame(width: 102, height: 72)
//                                        .clipShape(.capsule)
//                                        .overlay(
//                                        Capsule()
//                                            .strokeBorder(.white, lineWidth: 1)
//                                        )
//                                    VStack(alignment: .leading) {
//                                        Text(crewMember.astronaut.name)
//                                            .foregroundStyle(.white)
//                                            .font(.headline)
//                                        Text(crewMember.role)
//                                            .foregroundStyle(.gray)
//                                        
//                                    }
//                                }
//                                .padding(.horizontal)
//                            }
//                            
//                        }
//                    }
//                }
            }
            .padding(.bottom)
            
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }}
        
    }
}



#Preview {
    let missions: [Mission] =  Bundle.main.decode("missions.json")
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[3], astronauts: astronauts).preferredColorScheme(.dark)
}
