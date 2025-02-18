//
//  ContentView.swift
//  Battle of Bikrampur
//
//  Created by Zunayed Siddiqui on 2/14/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card13"
    @State var cpuCard = "card5"
    
    @State var playerScore = 0;
    @State var cpuScore = 0;
    
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
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button {
                    dealButtonAction()
                } label: {
                    Image("button")
                }

                Spacer()
                
                // HStack for player/cpu scores
                HStack{
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
            
        }
    }
    
    func dealButtonAction(){
        // Randomize the player card
        var playerCardVal = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardVal)
        
        // Randomize the cpu card
        var cpuCardVal = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardVal)
        
        // Update scores
        if(playerCardVal > cpuCardVal) {
            playerScore+=1
        } else if (playerCardVal < cpuCardVal) {
            cpuScore+=1
        }
    }
}

#Preview {
    ContentView()
}
