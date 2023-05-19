//
//  HomeView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 15/05/23.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    let imageNames = ["rio", "amalfi", "sydney", "ny", "paris", "london"]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Spacer()
                LocationView()
                Text("Qual seu próximo destino?")
                    .font(.system(size: 32, weight: .bold, design: .default))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "131F2A"))
                    .padding(.top, 30)

                SearchBarView(searchText: $searchText)
                    .padding(.top, 8)

                Text("Destinos populares")
                    .font(.system(size: 18, weight: .bold))
                    .fontWeight(.bold)
                    .padding(.top, 32)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<6) { index in
                            MediumCardView(image: Image(imageNames[index]))
                        }
                    }
                }

                Text("Perto de você")
                    .font(.system(size: 18, weight: .bold))
                    .fontWeight(.bold)
                    .padding(.top, 32)

                VStack(spacing: 15) {
                    ForEach(0..<3) { index in
                        SmallListItemView(image: Image(imageNames[index]))
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .background(Color(hex: "F5F8F9"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
