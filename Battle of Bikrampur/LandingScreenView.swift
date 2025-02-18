//
//  LandingScreenView.swift
//  Battle of Bikrampur
//
//  Created by Zunayed Siddiqui on 2/17/25.
//

import SwiftUI

struct LandingScreenView: View {
    var body: some View {
            // Navigation Steps
            NavigationView {
                NavigationLink(destination: ContentView()) {
                    ZStack{
                        // Background image
                        Image("background-cloth")
                            .resizable()
                            .ignoresSafeArea()
                        VStack {
                            Text("BATTLE OF BIKRAMPUR")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top, 70.0)
                                .fontDesign(.monospaced)
                                .foregroundColor(.white)
                            Spacer()
                            Text("Tap anywhere to start")
                                .font(.title2)
                                .padding(.vertical)
                                .foregroundColor(Color.orange)
                            Image(systemName: "play.fill")
                                .foregroundColor(Color.orange)
                            Spacer()
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
            }
    }
}

#Preview {
    LandingScreenView()
}
