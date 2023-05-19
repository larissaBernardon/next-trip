//
//  SmallListItemView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 17/05/23.
//

import SwiftUI

struct SmallListItemView: View {
    var image: Image

    var body: some View {
        HStack(spacing: 15) {
            image
                .resizable()
                .cornerRadius(12)
                .frame(width: 60, height: 60)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 8)

            VStack(alignment: .leading) {
                Text("Título")
                    .font(.headline)

                Text("Subtítulo")
                    .font(.subheadline)
            }
            Spacer()
            Image(systemName: "arrow.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
}

struct SmallListItemView_Previews: PreviewProvider {
    static var previews: some View {
        SmallListItemView(image: Image("rio"))
    }
}
