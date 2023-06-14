//
//  SignInView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 14/06/23.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("Sign in")
                    .foregroundColor(.white)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
