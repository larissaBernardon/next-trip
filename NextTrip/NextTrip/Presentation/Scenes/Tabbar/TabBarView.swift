//
//  TabbarView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 15/05/23.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Explorar")
                }
                .tag(0)

            TripsView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Viagens")
                }
                .tag(1)

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }
                .tag(2)
        }
        .accentColor(Color(hex: "222222"))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
