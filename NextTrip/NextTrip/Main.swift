//
//  NextTripApp.swift
//  NextTrip
//
//  Created by larissa.bernardon on 08/04/23.
//

import SwiftUI

@main
struct Main: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .overlay(alignment: .top, content: {
                    Color.clear
                        .background(Color(hex: "F5F8F9"))
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 0)
                })
        }
    }
}
