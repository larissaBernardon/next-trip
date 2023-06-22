//
//  SignInView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 14/06/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            TabBarView()
                .overlay(alignment: .top) {
                    Color.clear
                        .background(Color(hex: "F5F8F9"))
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 0)
                }
        } else {
            signInContent()
        }
    }

    func signInContent() -> some View {
        return ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 20) {
                Image("login")
                    .aspectRatio(contentMode: .fill)
                    .clipped()

                Text("Registrar-se")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)

                Spacer(minLength: 40)

                Button(action: {
                    isLoggedIn = true
                }) {
                    HStack(alignment: .top, spacing: 15) {
                        Image("logo")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .background(Color.black)

                        Text("Sign Up with Apple")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: UIScreen.main.bounds.size.width * 0.85, minHeight: 44)
                    .padding(.horizontal)
                    .background(Color.black)
                    .cornerRadius(10)
                }

                HStack {
                    Text("Já possui conta? ")
                    Text("Entrar")
                        .fontWeight(.bold)
                }
                .font(.system(size: 18))
                .foregroundColor(.black)

                Spacer()
            }
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
