//
//  SmallListItemView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 17/05/23.
//

import SwiftUI

struct Content {
    var imageString: String
    let title: String
    let distance: String
}

struct SmallListItemView: View {
    var content: Content

    var body: some View {
        HStack(spacing: 10) {
            Image(content.imageString)
                .resizable()
                .cornerRadius(12)
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 8)

            VStack(alignment: .leading, spacing: 5) {
                Text(content.title)
                    .lineLimit(1)
                    .font(.headline)

                Text(content.distance)
                    .font(.subheadline)
            }
            Spacer(minLength: 5)
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
        SmallListItemView(content: .init(imageString: "rio", title: "casa de cultura mario quintana", distance: "4,4 km"))
    }
}
