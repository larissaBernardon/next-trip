//
//  UpcomingTripsPage.swift
//  NextTrip
//
//  Created by larissa.bernardon on 22/05/23.
//

import SwiftUI

struct UpcomingTripsPage: View {
    let trips: [Trip]

    var upcomingTrips: [Trip] {
        let currentDate = Date()
        return trips.filter { trip in
            if let date = DataManager.dateFromString(trip.plan.dates.startDate, format: "dd/MM/yyyy") {
                return !Calendar.current.isDate(date, inSameDayAs: currentDate)
            }
            return false
        }
    }

    var body: some View {
        if upcomingTrips.isEmpty {
            Text("Você ainda não possui viagens futuras.")
        } else {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(upcomingTrips.reversed()) { trip in
                        NavigationLink(
                            destination: DestinationDetail(destination: trip.destination, shouldShowPlanningButton: false)
                        ) {
                            MediumCardView(
                                image: Image(trip.destination.imageName),
                                width: UIScreen.main.bounds.width * 0.9,
                                withOpacity: true,
                                centeredTitle: trip.destination.name
                            )
                            .padding(.horizontal)
                            .background(Color(hex: "F5F8F9"))
                            .cornerRadius(20)
                        }
                    }
                }
                .padding(.top)
            }
        }
    }
}
