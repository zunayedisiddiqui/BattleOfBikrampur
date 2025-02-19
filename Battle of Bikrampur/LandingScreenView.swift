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
                            Text("Rules:")
                                .font(.title2)
                                .foregroundColor(Color.yellow)
                                .padding(.bottom, 2.0)
                            Text("1. First to 7points wins!")
                                .font(.title3)
                                .foregroundColor(Color.yellow)
                            Text("2. Two Players draw cards randomly")
                                .font(.title3)
                                .foregroundColor(Color.yellow)
                            Text("3. Higher card gets point")
                                .font(.title3)
                                .foregroundColor(Color.yellow)
                            Spacer()
                            Text("Tap anywhere to start")
                                .font(.title2)
                                .padding(.vertical)
                                .foregroundColor(Color.orange)
                            Image(systemName: "play.fill")
                                .foregroundColor(Color.orange)
                            Spacer()
                            Spacer()
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
