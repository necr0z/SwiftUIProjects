//
//  ContentView.swift
//  Shared
//
//  Created by Nicole Yu on 27/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        TabBar()
    }
}

/** SPOTIFY COLORS
    1. Spotify TabBar Bar Tint Color
        #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
 
    2. Spotify TabBar Tint Color
        #colorLiteral(red: 0.9960784314, green: 0.9960784314, blue: 1, alpha: 1)
 
    3. Spotify Background Gradient Color
        #colorLiteral(red: 0.262745098, green: 0.2470588235, blue: 0.2745098039, alpha: 1)

    4. Spotify Green
        #colorLiteral(red: 0.1725490196, green: 0.8156862745, blue: 0.4196078431, alpha: 1)
 
    5. Now Playing background
        #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.137254902, alpha: 1)
 */
