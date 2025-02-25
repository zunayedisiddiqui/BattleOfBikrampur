//
//  GameSetupView.swift
//  Battle of Bikrampur
//
//  Game Setup screen where players select number of rounds
//
//  Created by Zunayed Siddiqui on 2/25/25.
//

import SwiftUI

struct GameSetupView: View {
    @State private var selectedRounds = 5
    @State private var navigateToGame = false
    
    let roundOptions = [3, 5, 7, 10]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image
                Image("background-wood-cartoon")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    Text("GAME SETUP")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .fontDesign(.monospaced)
                        .padding(.top, 50)
                    
                    Text("Select # of Points to Win:")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    // Round selection buttons
                    VStack(spacing: 20) {
                        ForEach(roundOptions, id: \.self) { rounds in
                            Button(action: {
                                selectedRounds = rounds
                            }) {
                                Text("\(rounds)")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .frame(width: 200, height: 50)
                                    .background(
                                        selectedRounds == rounds ? Color.green : Color.orange
                                    )
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.vertical, 30)
                    
                    Spacer()
                    
                    // Updated Start Game Button
                    Button {
                        navigateToGame = true
                    } label: {
                        VStack {
                            Image(systemName: "flag.checkered.circle.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.green)
                            Text("Start Game")
                                .font(.title2)
                                .foregroundColor(.green)
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $navigateToGame) {
                ContentView(roundsToWin: selectedRounds)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    GameSetupView()
} 
