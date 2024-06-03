//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Glen Chen on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Wasd")
        Text("nigwafdwoaiejfdwoau").watermarked(with: "Hacking w swift")
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

#Preview {
    ContentView()
}
