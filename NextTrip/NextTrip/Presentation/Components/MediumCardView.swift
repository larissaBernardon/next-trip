//
//  MediumCardView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 17/05/23.
//

import SwiftUI

struct MediumCardView: View {
    var image: Image
    var width: CGFloat? = 320
    var withOpacity: Bool = false
    var centeredTitle: String = ""

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: width, height: 180)
            .foregroundColor(.gray)
        
            .overlay(
                ZStack {
                    image
                        .resizable()
                        .cornerRadius(10)

                    if withOpacity {
                        Color.black.opacity(0.5)
                        .cornerRadius(10)
                        Text(centeredTitle)
                            .font(.title)
                            .foregroundColor(.white)
                    } else {
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, Color.black.opacity(0.1)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    }
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
