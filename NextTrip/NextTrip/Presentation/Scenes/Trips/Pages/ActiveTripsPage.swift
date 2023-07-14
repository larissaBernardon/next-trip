import SwiftUI

public struct ActiveTripsPage: View {
    let trip: Trip?

    public var body: some View {
        if let trip = trip {
            buildContentState(trip: trip)
        } else {
            Text("Ainda não há viagens atuais.")
        }
    }

    @ViewBuilder
    func buildContentState(trip: Trip) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                NavigationLink(
                    destination: DestinationDetail(destination: trip.destination, shouldShowPlanningButton: false)
                ) {
                    MediumCardView(
                        image: Image(trip.destination.imageName),
                        width: UIScreen.main.bounds.width * 0.90,
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
