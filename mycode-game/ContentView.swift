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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
