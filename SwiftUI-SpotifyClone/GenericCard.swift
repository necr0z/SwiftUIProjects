//
//  GenericCard.swift
//  SpotifyPart1-starter
//
//  Created by Glen Chen on 27/10/21.
//

import SwiftUI

struct GenericCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("3-shots")
                .resizable()
                .cornerRadius(3)
                .frame(width: 130, height: 130)
                .aspectRatio(contentMode: .fill)
            
            Text("3 Shots of Tequila")
                .foregroundColor(.white)
                .fontWeight(.semibold)
            
            Text("Podcast")
                .foregroundColor(.gray)
                .font(.subheadline)
        }
    }
}

struct GenericCard_Previews: PreviewProvider {
    static var previews: some View {
        GenericCard()
            .preferredColorScheme(.dark)
    }
}
