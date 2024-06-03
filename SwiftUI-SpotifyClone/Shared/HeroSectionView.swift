//
//  HeroSectionView.swift
//  SpotifyPart1-starter
//
//  Created by Glen Chen on 27/10/21.
//

import SwiftUI

struct HeroSectionView: View {
    
    var columns = [GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        VStack {
            SectionTitle(title: "Good evening")
            
            LazyVGrid(columns: columns, spacing: nil, content: {
                HeroCard()
                HeroCard()
                HeroCard()
                HeroCard()
            })
                .padding()
        }
        
    }
}

struct HeroSectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeroSectionView()
            .preferredColorScheme(.dark)
    }
}
