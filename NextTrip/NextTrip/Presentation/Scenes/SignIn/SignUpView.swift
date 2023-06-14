//
//  SignUpView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 14/06/23.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("Sign Uo")
                    .foregroundColor(.white)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
