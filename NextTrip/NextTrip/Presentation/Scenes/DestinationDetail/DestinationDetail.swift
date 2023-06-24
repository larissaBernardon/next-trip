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

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ParallaxHeader(
                coordinateSpace: CoordinateSpaces.scrollView,
                defaultHeight: 300) {
                Image(destination.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
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
        }
    }
}

struct DestinationDetail_Previews: PreviewProvider {
    static var previews: some View {
        DestinationDetail(destination: .init(city: "teste", country: "teste", bioSummary: "testeeeee", imageName: "Madrid", history: "", geography: "", language: "", currency: "", bestTimeToVisit: ""))
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


