//
//  LandingScreenView.swift
//  Battle of Bikrampur
//
//  Landing screen of app
//
//  Created by Zunayed Siddiqui on 2/17/25.
//

import SwiftUI

struct LandingScreenView: View {
    @State private var isAnimating = false
    @State private var navigateToSetup = false
    
    var body: some View {
        NavigationStack {  // Updated to NavigationStack
            Button {
                navigateToSetup = true
            } label: {
                ZStack {
                    // Background image
                    Image("background-cloth")
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        // Title with animation
                        Text("HIGH CARD DUEL")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 70.0)
                            .fontDesign(.monospaced)
                            .foregroundColor(.white)
                            .scaleEffect(isAnimating ? 1.1 : 1.0)
                            .animation(
                                Animation.easeInOut(duration: 1.0)
                                    .repeatForever(autoreverses: true),
                                value: isAnimating
                            )
                        
                        Spacer()
                        
                        // Rules section with emojis
                        Text("Game Rules:")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.yellow)
                            .padding(.bottom, 2.0)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            RuleRow(emoji: "🎯", text: "First to X points wins!")
                            RuleRow(emoji: "🎲", text: "Two Players draw cards randomly")
                            RuleRow(emoji: "👑", text: "Higher card gets point")
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        // Start prompt with animation
                        VStack {
                            Image(systemName: "play.fill")
                                .foregroundColor(.orange)
                                .font(.title)
                                .scaleEffect(isAnimating ? 1.2 : 1.0)
                                .animation(
                                    Animation.easeInOut(duration: 0.5)
                                        .repeatForever(autoreverses: true),
                                    value: isAnimating
                                )
                            Text("Tap anywhere to start")
                                .font(.title2)
                                .foregroundColor(.orange)
                                .padding(.top, 10.0)
                        }
                        .padding(.vertical)
                        
                        Spacer()
                        Spacer()
                        
                        // Credits
                        Text("built by")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Text("Zunayed Siddiqui")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToSetup) {
                GameSetupView()
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

// Helper view for rules
struct RuleRow: View {
    let emoji: String
    let text: String
    
    var body: some View {
        HStack(spacing: 10) {
            Text(emoji)
                .font(.title2)
            Text(text)
                .font(.title3)
                .foregroundColor(.yellow)
        }
    }
}

#Preview {
    LandingScreenView()
}
