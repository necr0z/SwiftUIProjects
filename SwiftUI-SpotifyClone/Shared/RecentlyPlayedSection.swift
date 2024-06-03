//
//  RecentlyPlayedSection.swift
//  SpotifyPart1-starter
//
//  Created by Glen Chen on 27/10/21.
//

import SwiftUI

struct RecentlyPlayedSection: View {
    var body: some View {
        VStack {
            SectionTitle(title: "Recently played")
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 16){
                    
//                    RecentlyPlayedCard(data:GenericContent.recentlyPlayedData[1])
                    
                    ForEach(GenericContent.recentlyPlayedData) {
                        item in RecentlyPlayedCard(data: item)
                    }
                
                
                }
                .padding()
                .padding(.top, -16)
            })
        }
    }
}

struct RecentlyPlayedSection_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyPlayedSection()
            .preferredColorScheme(.dark)
    }
}
