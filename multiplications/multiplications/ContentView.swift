
import SwiftUI

struct ContentView: View {
    
    //    questions = for no of qn int.random[1...12]
    //    print question what is base number * i , if user input == that answer score += 1, questionsleft -= 1 when questionsleft = 0 alert score.
    
    @State private var gameActive = false
    @State private var questionsLeft = 20
    
    @State private var baseNumber = 1
    
    let availableQuestions = [5, 10, 15, 20]
    @State private var chosenQuestions = 5
    
    @State private var userAnswer = "0"
    
    func startGame() {
        var multiplierBank = [Int]()
        questionsLeft = chosenQuestions
        for _ in 1...chosenQuestions {
            multiplierBank.append(baseNumber * Int.random(in: 1...12))
        }
        
        
        return
    }
    
    
    
    var body: some View {
           

            NavigationStack{
                VStack{
                    Spacer()
                    Stepper("Learning multiples of: \(baseNumber)",value: $baseNumber, in: 1...12 , step: 1)
                    Stepper("Number of Questions: \(chosenQuestions)", value: $chosenQuestions, in: 5...20, step: 5)
                    Spacer()
                    NavigationLink {
                        GameView(answer: $userAnswer, baseNumber: $baseNumber, numberOfQuestions: $chosenQuestions)
                    } label: {Text("Start game frfr")}
                    Spacer()
                    
                }
                .navigationTitle("Do a little multiblyin")
                .background(LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                
            }
         
            
        }
    
}

struct GameView: View {
    @Binding var answer: String
    @Binding var baseNumber: Int
    @Binding var numberOfQuestions: Int
    
    @State private var multiplier = Int.random(in: 1...12)
    
    @State private var gameScore = 0
    @State private var rounds = 0
    
    @State private var showAlert = false

    
    
    func generateAnswer() -> Int {
        //Eg. 5 * 3 = 15
        let ans = baseNumber * multiplier
        print("Ans: \(ans)")
        return ans
    }
    func generateQuestion() -> String {
        
        return "What is \(baseNumber) x \(multiplier)?"
    }
    
    func gameCheck(userAnswer: String) -> Bool {
        let correctAnswer = generateAnswer()
        print(userAnswer)
        let correct: Bool
        if Int(userAnswer) == correctAnswer {
            print("Correct")
            correct = true
            gameScore += 1
            rounds += 1
        } else {
            print("wrong")
            correct = false
            rounds += 1
        }
        // change multiplier
        multiplier = Int.random(in: 1...12)
        // call generate question
        generateAnswer()
        // reset $answer to 0
        answer = ""
        
        //
        if rounds == numberOfQuestions {
            showAlert = true
            
                }
        
        return correct
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Text(generateQuestion())
                TextField("Answer", text: $answer).keyboardType(.numberPad)
                Button("submit"){
                    gameCheck(userAnswer: answer)
                }
                .toolbar {
                    Text("Score : \(gameScore)")
                }
            }
            
            .alert("Game end u got \(gameScore) out of \(numberOfQuestions)", isPresented: $showAlert, actions: {
                Button("k nig im done fuck it"){gameScore = 0}
            })
        }
        .background(LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
}


#Preview {
    ContentView()
}
