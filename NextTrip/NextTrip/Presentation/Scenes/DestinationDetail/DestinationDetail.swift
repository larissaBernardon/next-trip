//
//  DestinationDetail.swift
//  NextTrip
//
//  Created by larissa.bernardon on 11/06/23.
//

import SwiftUI

struct DestinationDetail: View {
    let destination: Destination

    var body: some View {
        ZStack(alignment: .top) {
            Image(destination.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()
                .ignoresSafeArea()

            VStack {
                Spacer()

                Text(destination.city)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct DestinationDetail_Previews: PreviewProvider {
    static var previews: some View {
        DestinationDetail(destination: .init(city: "teste", country: "teste", bioSummary: "testeeeee", imageName: "Madrid", history: "", geography: "", language: "", currency: "", bestTimeToVisit: ""))
    }
}
