//
//  ItneraryView.swift
//  NextTrip
//
//  Created by larissa.bernardon on 22/05/23.
//

import SwiftUI

struct ItineraryView: View {
    let activities: [Activity]

    var body: some View {
        ScrollView(.vertical) {
            HStack {
                VerticalBar(count: activities.count)
                VStack(spacing: 20) {
                    ForEach(activities.indices, id: \.self) { index in
                        ItineraryRow(activity: activities[index])
                    }

                    Spacer()
                }
                //.background(Color.red)
                .padding()
            }
            .frame(maxHeight: .infinity)
            //.background(Color.yellow)
        }
    }
}

struct ItineraryRow: View {
    let activity: Activity

    var body: some View {
        VStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(activity.title)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.black)

                Text(activity.description)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.gray)

                Spacer()

                HStack {
                    Text("Visualizar no mapa")
                        .font(.subheadline)
                        .foregroundColor(Color.blue)
                    Image(systemName: "map")
                        .font(.system(size: 20))
                        .foregroundColor(Color.blue)
                }
            }
            .background(Color.white)
            .frame(maxWidth: .infinity)
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .frame(maxWidth: .infinity, maxHeight: 150)
        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
    }
}

struct VerticalBar: View {
    let count: Int

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<count) { _ in
                Rectangle()
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 2, height: 150)
                    .padding(.leading)
                    .foregroundColor(.darkGray)
            }
        }
    }
}
