//
//  ContentView.swift
//  Battle of Bikrampur
//
//  Main UI View of game screen
//
//  Created by Zunayed Siddiqui on 2/14/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    let roundsToWin: Int
    
    @State var player1Card = "back"
    @State var player2Card = "back"
    
    @State var player1Score = 0;
    @State var player2Score = 0;
    
    @State private var showAlert = false
    @State private var winnerMessage = ""
    
    @State private var isPlayer1Turn = true
    @State private var player1CardVal = 0
    
    @State private var showNextRoundButton = false
    
    @State private var player1WonRound = false
    @State private var player2WonRound = false
    
    @State private var showVictoryScreen = false
    
    @Environment(\.dismiss) private var dismiss
    
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
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 8)
                                .opacity(player1WonRound ? 1 : 0)
                        )
                    Spacer()
                    Image(player2Card)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 8)
                                .opacity(player2WonRound ? 1 : 0)
                        )
                    Spacer()
                }
                Spacer()
                if showNextRoundButton {
                    Button {
                        // Reset for next round
                        player1Card = "back"
                        player2Card = "back"
                        showNextRoundButton = false
                        // Reset the highlight states
                        player1WonRound = false
                        player2WonRound = false
                    } label: {
                        VStack {
                            Image("play")
                            Text("Click for next round")
                                .foregroundColor(.white)
                        }.padding(.bottom, 30.0)
                    }
                } else {
                    Button {
                        dealButtonAction()
                    } label: {
                        VStack {
                            Image("button")
                            Text(isPlayer1Turn ? "Player 1 Deal" : "Player 2 Deal")
                                .foregroundColor(.white)
                        }
                    }
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
            
            // Victory overlay
            if showVictoryScreen {
                Color.black.opacity(0.7)
                    .ignoresSafeArea()
                
                VStack {
                    Text("🎉 VICTORY! 🎉")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.yellow)
                        .padding()
                        .transition(.scale)
                    
                    Text(winnerMessage)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer().frame(height: 50)
                    
                    HStack(spacing: 40) {
                        // New Game Button - Modified to return to LandingScreenView
                        Button {
                            // Dismiss all the way back to root view (LandingScreenView)
                            dismiss()
                        } label: {
                            VStack {
                                Image(systemName: "arrow.counterclockwise.circle.fill")
                                    .font(.system(size: 50))
                                Text("New Game")
                            }
                            .foregroundColor(.green)
                        }
                        
                        // Exit Button
                        Button {
                            exit(0)
                        } label: {
                            VStack {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 50))
                                Text("Exit Game")
                            }
                            .foregroundColor(.red)
                        }
                    }
                }
                .transition(.scale)
            }
        }
    }
    
    func dealButtonAction() {
        // Trigger vibration
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
        feedbackGenerator.prepare()
        feedbackGenerator.impactOccurred()
        
        if isPlayer1Turn {
            player1CardVal = Int.random(in: 2...14)
            player1Card = "card" + String(player1CardVal)
            isPlayer1Turn = false
            player1WonRound = false
            player2WonRound = false
        } else {
            // Player 2's turn
            let player2CardVal = Int.random(in: 2...14)
            player2Card = "card" + String(player2CardVal)
            
            // Compare cards and update score
            if(player1CardVal > player2CardVal) {
                player1Score += 1
                player1WonRound = true
                player2WonRound = false
            } else if (player1CardVal < player2CardVal) {
                player2Score += 1
                player2WonRound = true
                player1WonRound = false
            } else {
                player1WonRound = false
                player2WonRound = false
            }
            
            // Check if winner
            if(player1Score == roundsToWin || player2Score == roundsToWin) {
                winnerMessage = player1Score == roundsToWin ? "Player 1 Wins!" : "Player 2 Wins!"
                showVictoryScreen = true
            }
            
            // Show next round button instead of resetting immediately
            showNextRoundButton = true
            isPlayer1Turn = true
        }
    }
}

#Preview {
    ContentView(roundsToWin: 7)
}
