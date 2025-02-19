//
//  ContentView.swift
//  Battle of Bikrampur
//
//  Created by Zunayed Siddiqui on 2/14/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var player1Card = "card13"
    @State var player2Card = "card5"
    
    @State var player1Score = 0;
    @State var player2Score = 0;
    
    @State private var showAlert = false
    @State private var winnerMessage = ""
    
    var body: some View {
        // Master stack
        ZStack {
            // Background image
            Image("background-wood-grain")
                .resizable()
                .ignoresSafeArea()

            // VStack for all items inside screen
            VStack {
                Spacer()
                Text("BATTLE OF BIKRAMPUR")
                    .font(.title)
                    .fontWeight(.bold)
                    .fontDesign(.monospaced)
                    .foregroundColor(.white)
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(player1Card)
                    Spacer()
                    Image(player2Card)
                    Spacer()
                }
                Spacer()
                Button {
                    dealButtonAction()
                } label: {
                    Image("button")
                }
                Spacer()
                
                // HStack for players scores
                HStack{
                    Spacer()
                    VStack {
                        Text("Player 1")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(player1Score))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("Player 2")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(player2Score))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                    title: Text("Game Over"),
                    message: Text(winnerMessage),
                    primaryButton: .default(Text("New Game")) {
                        // Reset scores
                        player1Score = 0
                        player2Score = 0
                    },
                    secondaryButton: .default(Text("Exit App")) {
                        // Close the app
                        exit(0)
                    }
                )
        }
    }
    
    func dealButtonAction(){
        // Trigger vibration
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        feedbackGenerator.prepare() // Prepares the feedback generator
        feedbackGenerator.impactOccurred() // Triggers the vibration
        
        // Randomize player 1  card
        let player1CardVal = Int.random(in: 2...14)
        player1Card = "card" + String(player1CardVal)
        
        // Randomize player 2  card
        let player2CardVal = Int.random(in: 2...14)
        player2Card = "card" + String(player2CardVal)
        
        // Update scores
        if(player1CardVal > player2CardVal) {
            player1Score+=1
        } else if (player1CardVal < player2CardVal) {
            player2Score+=1
        }
        
        // Check if winner
        if(player1Score == 7 || player2Score == 7) {
            winnerMessage = player1Score == 7 ? "Player 1 Wins!" : "Player 2 Wins!"
            showAlert = true
        }
    }
}

#Preview {
    ContentView()
}
