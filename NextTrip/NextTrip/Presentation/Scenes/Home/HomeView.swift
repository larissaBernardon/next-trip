//
//  HomeView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 15/05/23.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual seu próximo destino?")
                .font(.system(size: 32, weight: .bold, design: .default))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 70)


            SearchBar(searchText: $searchText)
                .padding(.top, 8)

            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Procurar destinos...", text: $searchText)
                .font(.subheadline)
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(Color(hex: "E9F2F5"))
                .foregroundColor(.gray)


            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 16, height: 16)
                .font(Font.system(size: 16, weight: .bold))
                .foregroundColor(Color(hex: "74BBD5"))
                .padding(.trailing, 16)
        }
        .background(Color(hex: "E9F2F5"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        self.init(
            red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgbValue & 0x0000FF) / 255.0
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
