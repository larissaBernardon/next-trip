//
//  LocationView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 17/05/23.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "location.circle.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color(hex: "74BBD5"))

            Text("Soledade, BRA")
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(Color(hex: "E9F2F5"))

        }
        .padding(.horizontal, 12)
        .background(Color(hex: "E9F2F5"))
        .cornerRadius(10)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
