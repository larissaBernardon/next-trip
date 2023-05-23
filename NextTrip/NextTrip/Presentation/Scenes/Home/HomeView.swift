//
//  HomeView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 15/05/23.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    let imageNames = ["Rio de Janeiro", "Lugano", "Cusco", "Madrid", "Sydney", "Nova Iorque", "Patagonia", "Paris", "Fernando de Noronha", "Istambul", "Londres"].shuffled()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Spacer()
                LocationView(name: "Porto Alegre, BRA")
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
                        ForEach(0..<10) { index in
                            MediumCardView(image: Image(imageNames[index]), withOpacity: true, centeredTitle: imageNames[index])
                        }
                    }
                }

                Text("Perto de você")
                    .font(.system(size: 18, weight: .bold))
                    .fontWeight(.bold)
                    .padding(.top, 32)

                VStack(spacing: 15) {
                    ForEach(0..<4) { index in
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
