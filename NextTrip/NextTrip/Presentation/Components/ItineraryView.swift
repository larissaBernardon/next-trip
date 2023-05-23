//
//  ItneraryView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 22/05/23.
//

import SwiftUI

struct ItineraryView: View {
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(itineraryData, id: \.self) { itineraryPoint in
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: 10) {
                            Text(itineraryPoint.time)
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            Text(itineraryPoint.title)
                                .font(.headline)
                                .foregroundColor(.darkGray)

                            Spacer()
                        }

                        if itineraryPoint != itineraryData.last {
                            Rectangle()
                                .fill(Color.mediumGray)
                                .frame(width: 2, height: 60)
                                .padding(.leading)
                        }
                    }
                }
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)

            Spacer()
        }
        .padding()
    }
}

struct ItineraryPoint: Identifiable, Equatable, Hashable {
    let id = UUID()
    let title: String
    let time: String
}

let itineraryData: [ItineraryPoint] = [
    ItineraryPoint(title: "Ponto de Partida", time: "09:00"),
    ItineraryPoint(title: "Ponto Intermediário 1", time: "10:30"),
    ItineraryPoint(title: "Ponto Intermediário 2", time: "12:00"),
    ItineraryPoint(title: "Destino", time: "14:00")
]

struct IineraryView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryView()
    }
}
