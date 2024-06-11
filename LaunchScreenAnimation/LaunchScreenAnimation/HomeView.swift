//
//  HomeView.swift
//  LaunchScreenAnimation
//
//  Created by Glen Chen on 11/6/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            
            Color.black.ignoresSafeArea()
            
            Text("amble is a genuine friendship space built on conversations, not faces").font(Font.custom("CormorantGaramond-Light", size: 20))
                .foregroundStyle(.white)
            
        }
    }
}

#Preview {
    HomeView()
}
