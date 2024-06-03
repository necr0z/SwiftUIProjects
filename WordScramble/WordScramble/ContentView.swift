//
//  ContentView.swift
//  WordScramble
//
//  Created by Glen Chen on 14/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
//    func addNewWord
//    |> lowercase
//    |> remove whitespace
//    |> >=1 character else exit
//    |> insert in newWords arr
//    |> set newWord = ""
    
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            wordError(title: "HUH", message: "u never type anything think i dunno? chibai")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard literallySameWord(word: answer) else {
            wordError(title: "Literally same word", message: "U cheeky cunt thats literally the same word")
            return
        }
        
        withAnimation{
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
        score += answer.count
            }
    
//  func startGame
//  |> find start.txt in bundle
//  |> load it into a string
//  |> split it into arr of strings, 1 element 1 word
//  |> pick one random word to rootWord ?? default
    
    func startGame(){
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let fileContents = try? String(contentsOf: fileURL) {
                let wordsArr = fileContents.components(separatedBy: "\n")
                
                rootWord = wordsArr.randomElement() ?? "aardvark"
                usedWords = [String]()
                score = 0
                return
            }
        }
//        here means cannot load the file at the start
        print("error")
        fatalError("Could not load start.txt from bundle.")
        
        
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    
    func literallySameWord(word: String) -> Bool {
        return word != rootWord
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    
    var body: some View {
        
        NavigationStack{
            List{
                Section(){
                    TextField("Enter ur word nig", text: $newWord).textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    
                }
                
                
                Section("ur words"){
                    ForEach(usedWords, id:\.self) { word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                    
                }
                Section("Score: \(score)"){}
                
            }
            
            .navigationTitle(rootWord)
                .onSubmit(addNewWord)
                .onAppear(perform: startGame)
                .alert(errorTitle, isPresented: $showingError){
                    
                } message: {
                    Text(errorMessage)
                }
                .toolbar{Button("restart"){startGame()}
                }
        }
    }
}

#Preview {
    ContentView()
}
