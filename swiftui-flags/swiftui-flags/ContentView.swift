//
//  ContentView.swift
//  swiftui-flags
//
//  Created by Glen Chen on 6/5/24.
//

import SwiftUI

struct beegandblue: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(.blue)
    }
}
extension View {
    func makeItBigAndBlue() -> some View {
        modifier(beegandblue())
    }
}

struct CapsuleImageView: View {
    
    var imageResource: String  // Name of the image resource in the asset catalog

    var body: some View {
        Image(imageResource)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Capsule())
            .shadow(radius: 5)
            .padding()
    }
}



struct ContentView: View {
    
    @State private var selectedFlag: Int? = nil
    
    
    @State private var score = 0
    
    @State private var finishGame = false
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US", "Claudinia"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct! So strong?"
            score += 1
        } else {
            scoreTitle = "Wrong what the fuck r u retarded \n that's the flag of \(countries[number])"
        }

        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedFlag = nil

    }
    
    func gameCheck() {
        if (score == 5) {
            finishGame.toggle()
            score = 0
        }
    }
    
    var body: some View {
        
        ZStack {
//            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            
            VStack {
                VStack{
//                    Text("deez").makeItBigAndBlue()
                    
                    Spacer()
                    Text("Guess the Flag").font(.largeTitle.weight(.bold)).foregroundStyle(.white)
                    
                    VStack(spacing: 15) {
                        Text("Tap the flag of").font(.subheadline.weight(.heavy)).foregroundStyle(.secondary)
                        Text(countries[correctAnswer]).font(.largeTitle.weight(.semibold))
                        
                    }.frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(.regularMaterial)
                        .clipShape(.rect(cornerRadius: 20))
                    ForEach(0..<3){
                        number in
                        Button {
                            withAnimation {
                                selectedFlag = number
                                flagTapped(number)
                                
                                gameCheck()
                            }
                        } label: {CapsuleImageView(imageResource: countries[number])
                                .frame(width: 250, height: 125)
                                .rotation3DEffect(
                                    .degrees(selectedFlag == number ? 360 : 0),
                                    axis: (x:0.0 , y: 1.0, z: 0.0)
                                )
                                .opacity(selectedFlag == nil ? 1 : (selectedFlag == number ? 1 : 0.25))

}
                            .clipShape(.capsule).shadow(radius: 5)
                        
                    }
                    Spacer()
                    Spacer()
                    Text("Score: \(score)")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                    Spacer()

                }
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }.padding()

        }
        .alert("ok ok good enough", isPresented: $finishGame) {
            Button("Restart", action: gameCheck)
        } message: {
            Text("ok fuck u won like 5 times restart pls")
        }
    }
}

#Preview {
    ContentView()
}
