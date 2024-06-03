

import SwiftUI

struct ContentView: View {
    
    @State private var roundNumber: Int = 1
    
    @State private var currentScore: Int = 0
    
    var moves: [String] = ["Rock", "Paper", "Scissors"]
    
    var winningMoves: [String] = ["Paper", "Scissors", "Rock"]
    var losingMoves: [String] = ["Scissors", "Rock", "Paper"]
    
    @State private var doALilRandoming: Int = Int.random(in: 0...2)
    
    @State private var canWin: Bool = true
    
    func buttonPressed() {
        print("Button pressed")
    }
    
    func gameCheck() {
        // Reset the game if 10 rounds are complete
        currentScore = 0
        roundNumber = 1
        doALilRandoming = Int.random(in: 0...2)
        canWin = Bool.random()
    }
    
    func buttonPressed(playerMove: String) {
            let correctMove = canWin ? winningMoves[doALilRandoming] : losingMoves[doALilRandoming]
            
            // Check if the player's move is the correct move
            if playerMove == correctMove {
                currentScore += 1
            }
            
            // Move to the next round and check if the game is over
            roundNumber += 1
            if roundNumber > 10 {
                gameCheck()
            } else {
                // Prepare for the next round
                doALilRandoming = Int.random(in: 0...2)
                canWin = Bool.random()
            }
        }
        
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Round \(roundNumber) of 10").font(.largeTitle).padding()
                
                Text("App chooses: \(moves[doALilRandoming])").font(.title).padding()
                Text("You should play to \(canWin ? "win" : "lose") this round").padding()
                
                HStack { ForEach(0..<moves.count, id: \.self) {index in
                    Button(action: {
                        self.buttonPressed(playerMove: moves[index])
                    }) {
                        Text(moves[index])
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                    
                }
                Text("Your current score: \(currentScore)")
                    
                    .navigationTitle("R,P,S")

            }
        }
    }
}

#Preview {
    ContentView()
}
