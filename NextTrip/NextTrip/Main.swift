//
//  NextTripApp.swift
//  NextTrip
//
//  Created by larissa.bernardon on 08/04/23.
//

import SwiftUI

@main
struct Main: App {
    @StateObject private var state = DestinationDetailState()

    var body: some Scene {
        WindowGroup {
            SplashView().environmentObject(state)
        }
    }
}
