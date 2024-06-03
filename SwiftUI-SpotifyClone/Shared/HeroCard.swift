//
//  HeroCard.swift
//  SpotifyPart1-starter
//
//  Created by Glen Chen on 27/10/21.
//

import SwiftUI

struct HeroCard: View {
    var body: some View {
        HStack {
            Image("jazz")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Chilled Jazz")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.footnote)
                .lineLimit(2)
            Spacer()
        }
        .frame(height: 90)
        .background(Color.white.opacity(0.085))
        .cornerRadius(5)
        
        
        
    }
}

struct HeroCard_Previews: PreviewProvider {
    static var previews: some View {
        HeroCard()
            .preferredColorScheme(.dark)
    }
}
