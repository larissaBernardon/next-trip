//
//  TripsView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 15/05/23.
//

import SwiftUI

struct TripsView: View {
    @State private var selectedIndex = 0
    private let sectionTitles = ["Ativas", "Próximas", "Passadas"]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Minhas viagens")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 32)

            HStack(spacing: 20) {
                ForEach(sectionTitles.indices, id: \.self) { index in
                    Button(action: {
                        selectedIndex = index
                    }) {
                        Text(sectionTitles[index])
                            .font(.body)
                            .foregroundColor(selectedIndex == index ? .black : .gray)
                            .padding(.vertical, 8)
                            .overlay(
                                selectedIndex == index ?
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
                VStack {
                    Text("Ativas")
                }
                .tag(0)

                VStack {
                    Text("Próximas")
                }
                .tag(1)

                VStack {
                    Text("Passadas")
                }
                .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .padding(.all)
        .background(Color(hex: "F5F8F9"))
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
