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
                .foregroundColor(Color(hex: "131F2A"))
                .padding(.top, 130)


            SearchBar(searchText: $searchText)
                .padding(.top, 8)

            Text("Perto de você")
                .font(.system(size: 18, weight: .bold))
                .fontWeight(.bold)
                .padding(.top, 32)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<5) { index in
                        CardView()
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(Color(hex: "F5F8F9"))
        .ignoresSafeArea()
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

struct CardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .frame(width: 200, height: 130)
            .foregroundColor(.darkGray)
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
