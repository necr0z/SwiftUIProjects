//
//  LaunchScreenView.swift
//  LaunchScreenAnimation
//
//  Created by Glen Chen on 11/6/24.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        LaunchView(title: "discover meaningful relationships", image: .sky, content: HomeView())
    }
}

#Preview {
    LaunchScreenView()
}
