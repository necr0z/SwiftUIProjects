//
//  GenericCardSectionView.swift
//  SpotifyPart1-starter
//
//  Created by Glen Chen on 27/10/21.
//

import SwiftUI

struct GenericCardSectionView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                GenericCard()
                GenericCard()
                GenericCard()
            }
        }
    }
}

struct GenericCardSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenericCardSectionView()
    }
}
