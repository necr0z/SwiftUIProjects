//
//  ContentView.swift
//  Navigation
//
//  Created by Glen Chen on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = [Int]()
    
    @State private var titleName = "sample title"
    var body: some View {
        NavigationStack(path: $path){
            ScrollView{
                Text("awd")
                Text("sd")
                Button("click me change title") {
                    titleName = "deez"
                    path = [333]
                    
                }

            }
            .navigationDestination(for: Int.self) {int in
                Text("u are in \(int)")
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Adw")
                }
            }
            .navigationTitle($titleName)
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    ContentView()
}
