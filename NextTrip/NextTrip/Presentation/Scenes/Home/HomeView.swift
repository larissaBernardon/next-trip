//
//  HomeView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 15/05/23.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""

    let destinations: [Destination]

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
                            ForEach(destinations.indices, id: \.self) { index in
                                let destination = destinations[index]
                                NavigationLink(destination: DestinationDetail(destination: destinations[index])) {
                                    MediumCardView(image: Image(destination.imageName), withOpacity: true, centeredTitle: destination.name)
                                }
                                .navigationBarBackButtonHidden(true)
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
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
            .edgesIgnoringSafeArea(.top) //
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
