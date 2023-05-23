//
//  ActiveTrips.swift
//  NextTrip
//
//  Created by larissa.bernardon on 22/05/23.
//

import SwiftUI

struct ActiveTripsPage: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                MediumCardView(image: Image("Rio de Janeiro"), width: UIScreen.main.bounds.width * 0.90, withOpacity: true, centeredTitle: "Rio de Janeiro")
                    .padding(.horizontal)
                    .cornerRadius(20)
                Spacer(minLength: 30)
                Text("Itinerário")
                    .padding(.horizontal)
                    .font(.title2)
                    .foregroundColor(.darkGray)
                ItineraryView()
            }
        }
        .padding(.top)
    }
}

struct ActiveTrips_Previews: PreviewProvider {
    static var previews: some View {
        ActiveTripsPage()
    }
}
