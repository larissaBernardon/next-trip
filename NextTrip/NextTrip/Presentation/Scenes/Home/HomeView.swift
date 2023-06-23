//
//  HomeView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 15/05/23.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""

    let destinations = ["Madrid", "Rio de Janeiro", "Lugano", "Cusco", "Sydney", "Nova Iorque", "Patagonia", "Fernando de Noronha", "Istambul", "Paris", "Londres"]

    let nearYou = ["mercadopublico": "Mercado público", "beirario": "Estádio Beira Rio", "marioquintana": "Casa de cultura Mario quintana", "parquefarroupilha": "Parque Farroupilha", "gasometro": "Usina do gasômetro"]

    var body: some View {
        NavigationView {
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
                                NavigationLink(destination: DestinationDetail()) {
                                    MediumCardView(image: Image(destinations[index]), withOpacity: true, centeredTitle: destinations[index])
                                }
                            }
                        }
                    }

                    Text("Perto de você")
                        .font(.system(size: 18, weight: .bold))
                        .fontWeight(.bold)
                        .padding(.top, 32)

                    VStack(spacing: 15) {
                        ForEach(Array(nearYou), id: \.0) { item in
                            SmallListItemView(content: .init(imageString: item.0, title: item.1, distance: "2,8 km"))
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .background(Color(hex: "F5F8F9"))
        }
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
