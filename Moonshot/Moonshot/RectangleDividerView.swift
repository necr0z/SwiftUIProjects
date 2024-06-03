//
//  RectangleDividerView.swift
//  Moonshot
//
//  Created by Glen Chen on 1/6/24.
//

import SwiftUI

struct RectangleDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height:2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    RectangleDividerView()
}
