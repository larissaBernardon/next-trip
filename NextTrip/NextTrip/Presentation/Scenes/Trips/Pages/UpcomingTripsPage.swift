//
//  UpcomingTripsPage.swift
//  NextTrip
//
//  Created by larissa.bernardon on 22/05/23.
//

import SwiftUI

struct UpcomingTripsPage: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                MediumCardView(image: Image("Fernando de Noronha"), width: UIScreen.main.bounds.width * 0.9, withOpacity: true, centeredTitle: "Frnando de Noronha")
                MediumCardView(image: Image("Istambul"), width: UIScreen.main.bounds.width * 0.9, withOpacity: true, centeredTitle: "Istambul")
                MediumCardView(image: Image("Nova Iorque"), width: UIScreen.main.bounds.width * 0.9, withOpacity: true, centeredTitle: "Nova Iorque")
                Spacer()
            }
            .padding(.top)
        }
    }
}

struct UpcomingTripsPage_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingTripsPage()
    }
}
