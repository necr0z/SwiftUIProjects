//
//  ContentView.swift
//  Moonshot
//
//  Created by Glen Chen on 29/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var gridView = true
    
    let astronauts: [String: Astronaut]  = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))]

    var body: some View {
        NavigationStack {
            
            //  the grid-list swap here
            Group{
                if gridView {
                    GridView()
                        
                } else {
                    ListView()
                }
                
            }
                .toolbar{
                    Button("Change View"){
                        gridView.toggle()
                    }
                }
                .navigationTitle("Moonshot")
                .background(.darkBackground)
                .preferredColorScheme(.dark)
            
        }
        
        
    }
    
}

#Preview {
    ContentView()
}
