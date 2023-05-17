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
        return WindowGroup {
           TabBarView()
                .background(Color(hex: "F5F8F9")).ignoresSafeArea(.all)
        }
    }
}
