//
//  ActiveTrips.swift
//  NextTrip
//
//  Created by larissa.bernardon on 22/05/23.
//

import SwiftUI

struct ActiveTripsPage: View {
    var body: some View {
        VStack {
            MediumCardView(image: Image("Rio de Janeiro"), width: UIScreen.main.bounds.width * 0.9, withOpacity: true, centeredTitle: "Rio de Janeiro")
            Spacer()
        }
        .padding(.top)
    }
}

struct ActiveTrips_Previews: PreviewProvider {
    static var previews: some View {
        ActiveTripsPage()
    }
}
