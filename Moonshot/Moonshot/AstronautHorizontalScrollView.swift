//
//  AstronautHorizontalScrollView.swift
//  Moonshot
//
//  Created by Glen Chen on 1/6/24.
//

import SwiftUI

struct AstronautHorizontalScrollView: View {
    
    let crew:[MissionView.CrewMember]
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(crew, id:\.role ) { crewMember in
                    NavigationLink { AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 102, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                Capsule()
                                    .strokeBorder(.white, lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.gray)
                                
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    let mockAstronauts = [
        Astronaut(id: "grissom", name: "Gus Grissom", description: "Astronaut description."),
        Astronaut(id: "white", name: "Ed White", description: "Astronaut description."),
        Astronaut(id: "chaffee", name: "Roger Chaffee", description: "Astronaut description.")
    ]
    
    let mockCrew = [
        MissionView.CrewMember(role: "Commander", astronaut: mockAstronauts[0]),
        MissionView.CrewMember(role: "Pilot", astronaut: mockAstronauts[1]),
        MissionView.CrewMember(role: "Lunar Module Pilot", astronaut: mockAstronauts[2])
    ]
    
    return AstronautHorizontalScrollView(crew: mockCrew)
        .preferredColorScheme(.dark)
}
