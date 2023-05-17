//
//  MediumCardView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 17/05/23.
//

import SwiftUI

struct MediumCardView: View {
    var image: Image

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 280, height: 180)
            .foregroundColor(.gray)
            .overlay(
                ZStack {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 280, height: 180)
                        .cornerRadius(10)

                    LinearGradient(
                        gradient: Gradient(colors: [.clear, Color.black.opacity(0.1)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .cornerRadius(10)
                }
            )
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

struct MediumCardView_Previews: PreviewProvider {
    static var previews: some View {
        MediumCardView(image: Image("rio"))
    }
}
