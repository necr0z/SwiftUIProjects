//
//  TabBar.swift
//  SpotifyPart1-starter
//
//  Created by Glen Chen on 27/10/21.
//

import SwiftUI

struct TabBar: View {
    
    init() {
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
        UITabBar.appearance().tintColor = .white
        
    }
    var body: some View {
        TabView{
            
            // Home Tab
            NavigationView{
                Text("Home")
            }
            .tabItem {
                Image("home-fill")
                Text("Home")
            }
            
            // Search Tab
            NavigationView {
                Text("Search")
            }
            .tabItem {
                Image("search")
                Text("Search")
            }
            
            // Library Tab
            NavigationView {
                Text("Library")
            }
            .tabItem {
                Image("library")
                Text("Library")
            }
        }
        .accentColor(.white)
        .preferredColorScheme(.dark)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
