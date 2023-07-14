//
//  DestinationDetail.swift
//  NextTrip
//
//  Created by larissa.bernardon on 11/06/23.
//

import SwiftUI

class DestinationDetailState: ObservableObject {
    @Published var isButtonEnabled = true
    @Published var shouldNavigateToTrips = false
}

private enum CoordinateSpaces {
    case scrollView
}

enum ButtonType {
    case planning
    case viewTripPlan
}

struct DestinationDetail: View {

    @EnvironmentObject private var state: DestinationDetailState
    @Environment(\.presentationMode) var presentationMode
    @State private var showPlanningScreen = false
    @State private var createdTrip: Trip?

    let trip: Trip?
    let destination: Destination
    let actionType: ButtonType

    init(trip: Trip? = nil, destination: Destination, actionType: ButtonType) {
        self.destination = destination
        self.actionType = actionType
        self.trip = trip

        setupNavigationStyle()
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ParallaxHeader(
                    coordinateSpace: CoordinateSpaces.scrollView,
                    defaultHeight: 250
                ) {
                    ZStack {
                        Image(destination.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)

                        Color.black.opacity(0.5)
                        VStack(spacing: 5) {
                            Text(destination.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            HStack {
                                Image(systemName: "mappin")
                                    .font(.title2)
                                    .foregroundColor(.white)

                                Text(destination.country)
                                    .font(.title2)
                                    .foregroundColor(.white)

                                if let flag = getFlagEmoji(countryCode: destination.countryCode) {
                                    Text(flag)
                                        .font(.system(size: 32))
                                }
                            }
                        }
                    }
                }

                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 30) {
                        if actionType == .planning {
                            Button(action: {
                                showPlanningScreen = true
                            }) {
                                Text("Planejar Viagem")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                            }
                            .sheet(isPresented: $showPlanningScreen) {
                                PlanningTripView(isPresented: $showPlanningScreen, destination: destination, createdTrip: $createdTrip)
                                    .onDisappear {
                                        if createdTrip != nil {
                                            state.shouldNavigateToTrips = true
                                        }
                                    }
                            }
                        } else if actionType == .viewTripPlan {
                            NavigationLink(destination: TripPlanView(trip: trip)) {
                                Text("Ver plano de viagem")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.black)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                            }
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Sobre:")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(destination.bioSummary).foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                            Divider().background(Color.gray).padding(.vertical, 10)
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("História")
                                .font(.title3)
                                .fontWeight(.semibold)

                            Text(destination.history).foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                            Divider().background(Color.gray).padding(.vertical, 10)
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Geografia:")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(destination.geography).foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                            Divider().background(Color.gray).padding(.vertical, 10)
                        }

                    }
                    .padding(20)
                }
                .frame(width: UIScreen.main.bounds.size.width)
                .background(Color.white)
                .cornerRadius(30)
                .padding(.top, -40)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: customBackButton)
        }
    }

    var customBackButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
                .imageScale(.large)
        }
    }

    private func setupNavigationStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }


    private func getFlagEmoji(countryCode: String) -> String? {
        let base: UInt32 = 127397
        var flagString = ""

        countryCode.uppercased().unicodeScalars.forEach {
            if let scalar = UnicodeScalar(base + $0.value) {
                flagString.append(String(scalar))
            }
        }

        return flagString.isEmpty ? nil : flagString
    }
}

struct HeaderBottomView: View {
    var body: some View {
        Rectangle()
            .fill(Color.pink)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
    }
}

struct ParallaxHeader<Content: View, Space: Hashable>: View {
    let content: () -> Content
    let coordinateSpace: Space
    let defaultHeight: CGFloat

    init(
        coordinateSpace: Space,
        defaultHeight: CGFloat,
        @ViewBuilder _ content: @escaping () -> Content
    ) {
        self.content = content
        self.coordinateSpace = coordinateSpace
        self.defaultHeight = defaultHeight
    }

    var body: some View {
        GeometryReader { proxy in
            let offset = offset(for: proxy)
            let heightModifier = heightModifier(for: proxy)
            content()
                .edgesIgnoringSafeArea(.horizontal)
                .frame(
                    width: proxy.size.width,
                    height: proxy.size.height + heightModifier
                )
                .offset(y: offset)
        }.frame(height: defaultHeight)
    }

    private func offset(for proxy: GeometryProxy) -> CGFloat {
        let frame = proxy.frame(in: .named(coordinateSpace))
        if frame.minY < 0 {
            return -frame.minY * 0.8
        }
        return -frame.minY
    }

    private func heightModifier(for proxy: GeometryProxy) -> CGFloat {
        let frame = proxy.frame(in: .named(coordinateSpace))
        return max(0, frame.minY)
    }
}


