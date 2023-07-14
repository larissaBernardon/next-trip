//
//  TripPlanView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 14/07/23.
//

import SwiftUI

struct TripPlanView: View {
    let trip: Trip?
    @State private var selectedIndex = 0

    var body: some View {
        if let trip = trip {
            VStack(alignment: .leading, spacing: 16) {
                Text("Plano de viagem")
                    .font(.title)
                    .fontWeight(.bold)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(trip.plan.days.indices, id: \.self) { index in
                            let day = trip.plan.days[index]
                            Button(action: {
                                selectedIndex = index
                            }) {
                                VStack(spacing: 4) {
                                    Text("Dia \(index + 1)")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text(day.day)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .padding(.bottom)
                                    Rectangle()
                                        .fill(Color.clear)
                                        .frame(width: 10, height: 5)
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 2)
                                        .frame(height: 2)
                                        .foregroundColor(.black)
                                        .opacity(index == selectedIndex ? 1 : 0)
                                        .padding(.top, 28)
                                )
                            }
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                        }
                    }
                }

                TabView(selection: $selectedIndex) {
                    ForEach(trip.plan.days.indices, id: \.self) { index in
                        let day = trip.plan.days[index]
                        ItineraryView(activities: day.activities)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .padding(.all)
            .background(Color(hex: "F5F8F9"))
        } else {
            Text("Houve um problema ao exibir o planejamento da viagem")
        }
    }
}
