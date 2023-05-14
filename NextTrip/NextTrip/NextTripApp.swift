//
//  NextTripApp.swift
//  NextTrip
//
//  Created by larissa.bernardon on 08/04/23.
//

import SwiftUI

@main
struct NextTripApp: App {
    var body: some Scene {
        return WindowGroup {
            NavigationView {
                ChatView()
                    .background(Color.darkGray.ignoresSafeArea(.all))
                    .foregroundColor(Color.white)
            }
        }
    }
}
