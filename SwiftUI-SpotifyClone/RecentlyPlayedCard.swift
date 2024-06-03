//
//  RecentlyPlayedCard.swift
//  SpotifyPart1-starter
//
//  Created by Glen Chen on 27/10/21.
//

import SwiftUI

struct RecentlyPlayedCard: View {
    
    var data: GenericContent
    
    
    var body: some View {
        VStack(alignment: .leading){
            Image(data.imageName)
                .resizable()
                .frame(width: 130, height: 130)
                .cornerRadius(3.0)
            Text(data.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        
        
    }
}

struct RecentlyPlayedCard_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyPlayedCard(data:GenericContent.recentlyPlayedData[1])
            .preferredColorScheme(.dark)
    }
}
