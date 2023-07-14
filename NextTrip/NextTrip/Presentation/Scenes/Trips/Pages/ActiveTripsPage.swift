import SwiftUI

protocol ActiveTripProtocol: AnyObject {
    func destinationTapped(destination: Destination)
}

public struct ActiveTripsPage: View {
    let trip: Trip?
    weak var delegate: ActiveTripProtocol?

    public var body: some View {
        if let trip = trip {
            buildContentState(trip: trip)
        } else {
            Text("ainda não há viagens atuais")
        }
    }

    func buildContentState(trip: Trip) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                NavigationLink(destination: DestinationDetail(destination: trip.destination, shouldShowPlanningButton: false)) {
                    MediumCardView(
                        image: Image(trip.destination.imageName),
                        width: UIScreen.main.bounds.width * 0.90,
                        withOpacity: true,
                        centeredTitle: trip.destination.name
                    )
                    .onTapGesture {
                        delegate?.destinationTapped(destination: trip.destination)
                    }
                    .padding(.horizontal)
                    .background(Color(hex: "F5F8F9"))
                    .cornerRadius(20)
                }
            }
        }
        .padding(.top)
    }

    func buildNoDataState() -> some View {
        VStack {
            Spacer()
            Image("ActiveTripNoData")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
            Spacer()
        }
    }
}
