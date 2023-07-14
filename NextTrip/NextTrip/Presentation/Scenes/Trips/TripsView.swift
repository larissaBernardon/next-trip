import SwiftUI

struct TripsView: View {
    @StateObject private var dataManager = DataManager()
    @State private var activeTrip: Trip?
    @State private var upcomingTrips: [Trip] = []
    @State private var selectedIndex = 0

    private var sectionContent: [String: AnyView] {
        let content: [String: AnyView] = [
            "Ativas": AnyView(ActiveTripsPage(trip: activeTrip)),
            "Próximas": AnyView(UpcomingTripsPage(trips: upcomingTrips))
        ]
        return content
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Minhas viagens")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 32)

                HStack(spacing: 20) {
                    ForEach(sectionContent.keys.sorted(), id: \.self) { key in
                        Button(action: {
                            selectedIndex = sectionContent.keys.sorted().firstIndex(of: key) ?? 0
                        }) {
                            Text(key)
                                .font(.body)
                                .foregroundColor(selectedIndex == sectionContent.keys.sorted().firstIndex(of: key) ? .black : .gray)
                                .padding(.vertical, 8)
                                .overlay(
                                    selectedIndex == sectionContent.keys.sorted().firstIndex(of: key) ?
                                    Rectangle()
                                        .frame(height: 2)
                                        .padding(.top, 28)
                                        .foregroundColor(.black) :
                                        nil
                                )
                        }
                    }
                }

                TabView(selection: $selectedIndex) {
                    ForEach(sectionContent.keys.sorted(), id: \.self) { key in
                        sectionContent[key]
                            .tag(sectionContent.keys.sorted().firstIndex(of: key) ?? 0)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .padding(.all)
            .background(Color(hex: "F5F8F9"))
            .onAppear {
                activeTrip = DataManager.getCurrentTrips()
                upcomingTrips = DataManager.getAllTrips()
            }
            .navigationBarHidden(true)
        }
    }
}
