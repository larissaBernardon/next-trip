//
//  SplashView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 19/05/23.
//

import SwiftUI

struct SplashView: View {
    @State private var isAnimating = false
    @State private var isActive = false

    var body: some View {
        if isActive {
            TabBarView()
                .overlay(alignment: .top, content: {
                    Color.clear
                        .background(Color(hex: "F5F8F9"))
                        .edgesIgnoringSafeArea(.top)
                    .frame(height: 0)
                })
        } else {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Spacer()
                    Image("airplane")
                        .resizable()
                        .scaledToFit()
                        .colorInvert()
                        .frame(width: 100, height: 100)
                        .offset(y: isAnimating ? -700 : 0)
                        .opacity(isAnimating ? 0 : 1)
                    Spacer().frame(height: 100)
                }
            }
            .onAppear {
                withAnimation(.linear(duration: 2.8)) {
                    isAnimating = true
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
                    isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
