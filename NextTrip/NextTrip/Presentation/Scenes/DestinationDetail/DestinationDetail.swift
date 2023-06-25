//
//  DestinationDetail.swift
//  NextTrip
//
//  Created by larissa.bernardon on 11/06/23.
//

import SwiftUI

private enum CoordinateSpaces {
    case scrollView
}

struct DestinationDetail: View {
    let destination: Destination
    @Environment(\.presentationMode) var presentationMode

    init(destination: Destination) {
        self.destination = destination

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
                            Text(destination.city)
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
                            }
                        }
                    }
                }

                HStack(alignment: .center) {
                    VStack {
                        Text("content text").padding()
                        Text("content text").padding()
                        Text("content text").padding()
                        Text("content text").padding()
                    }
                    .padding(10)
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
}

struct DestinationDetail_Previews: PreviewProvider {
    static var previews: some View {
        DestinationDetail(destination: .init(city: "Madrid", country: "Espanha", bioSummary: "testeeeee", imageName: "Madrid", history: "", geography: "", language: "", currency: "", bestTimeToVisit: ""))
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


