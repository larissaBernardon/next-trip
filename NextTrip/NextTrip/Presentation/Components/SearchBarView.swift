//
//  SearchBarView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 17/05/23.
//

import SwiftUI

struct SearchBarView: View {
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

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
