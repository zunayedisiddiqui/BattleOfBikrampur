//
//  ContentView.swift
//  Battle of Bikrampur
//
//  Created by Zuhreen Siddiqui on 2/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image("card2")
                    Spacer()
                    Image("card3")
                    Spacer()
                }
                Spacer()
                Button("", image: .button) {
                    
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text("0")
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text("0")
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
