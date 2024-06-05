//
//  GridView.swift
//  Moonshot
//
//  Created by Glen Chen on 3/6/24.
//

import SwiftUI

struct GridView: View {
    
    let astronauts: [String: Astronaut]  = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))]
    
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: columns){
                    ForEach(missions) {mission in
                        NavigationLink(value: mission) {
//                            refactored due to challenge 9. hashable the structs and put .navigationdestination and (value)
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:100, height:100)
                                    .padding()
                                
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white )
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                                
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                            
                        }
                    }
                    
                    
                }
                .padding([.horizontal, .bottom])
            }
            .navigationDestination(for: Mission.self) { mission in
                            MissionView(mission: mission, astronauts: astronauts)
                        }
        }
    }
}

#Preview {
    GridView()
        .navigationTitle("Moonshot")
        .background(.darkBackground)
        .preferredColorScheme(.dark)
}
