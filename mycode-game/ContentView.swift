//
//  ContentView.swift
//  mycode-game
//
//  Created by Nizam Mamedzadeh on 29.07.23.
//

import SwiftUI

struct ContentView: View {
    @State private var options = ["🪨", "📄", "✂️"]
    @State private var NToWin = Bool.random()
    @State private var rounds = 0
    
    let compNo = Int.random(in: 0...2)
    var toWin : String {
        if options[compNo] == "🪨" {
            return "📄"
        } else if options[compNo] == "📄" {
            return "✂️"
        } else {
            return "🪨"
        }
    }
    
    @State private var showsAlert = false
    @State private var titleAlert = ""
    @State private var wasCorrect = false
    @State private var score = 0
    @State private(set) var highScore = 0
    @State private var gameEnded = false
    
    var body: some View {
        ZStack {
            Color.blue
            VStack {
                Spacer()
                Text("Rock Paper Scissors")
                    .padding()
                    .scaledToFit()
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("Computer chose...")
                    .padding()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                    Text(options[compNo])
                        .font(.largeTitle)
                }
                .frame(width: 208, height: 68)
                .foregroundColor(.white)
                Text("You must ....")
                    .padding()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                    Text(NToWin ? "Win" : "Lose")
                        .foregroundColor(.white)
                        .padding()
                        .font(.largeTitle)
                }
                .frame(width: 208, height: 68)
                .foregroundColor(NToWin ? .green : .red)
                Text("What you should chose")
                    .padding()
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                        Button("🪨") {
                            let userOption = "🪨"
                            chosen(user: userOption)
                        } .foregroundColor(.yellow)
                    }
                    .frame(width: 65, height: 60)
                    .foregroundColor(.white)
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                        Button("📄") {
                            let userOption = "📄"
                            chosen(user: userOption)
                        } . foregroundColor(.black)
                    }
                    .frame(width: 65, height: 60)
                    .foregroundColor(.red)
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                        Button("✂️") {
                            let userOption = "✂️"
                            chosen(user: userOption)
                        } .foregroundColor(.black)
                    }
                    .frame(width: 65, height: 60)
                    .foregroundColor(.white)
                Spacer()
                }
                Spacer()
                HStack {
                    Text("Score: \(score) / \(rounds)")
                        .padding(20)
                    VStack {
                        Text("High Score: \(highScore)")
                        Button("Reset") {
                            highScore = 0
                        } .foregroundColor(.yellow)
                    }
                } .alert(titleAlert, isPresented: $showsAlert) {
                    Button("Next", action: nextQuestion)
                } message: {
                    if wasCorrect == true {
                        Text("Your score is \(score)")
                    } else {
                        Text("try again")
                    }
                }.alert("Game Over", isPresented: $gameEnded) {
                    Button("Restart game", action: gameOver)
                } message: {
                    if wasCorrect == true {
                        Text("Your final socre is \(score)")
                    } else {
                        Text("Your final score is \(score)")
                    }
                }
            }
        }
    }
    
    func chosen(user: String) {
        rounds += 1
        if user == toWin && NToWin == true {
            titleAlert = "Correct"
            wasCorrect = true
            score += 1
        }
        if user == toWin && NToWin == false {
            titleAlert = "Wrong"
            wasCorrect = false
        }
        if user != toWin && NToWin == true {
            titleAlert = "Wrong"
            wasCorrect = false
        }
        if user != toWin && NToWin == false {
            titleAlert = "Correct"
            wasCorrect = true
            score += 1
        }
        if rounds == 10 {
            gameEnded = true
        } else {
            showsAlert = true
        }
    }
    
    func nextQuestion() {
        options.shuffle()
        NToWin = Bool.random()
    }
    func gameOver() {
        nextQuestion()
        rounds = 0
        if score > highScore {
            highScore = score
        }
        score = 0
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
