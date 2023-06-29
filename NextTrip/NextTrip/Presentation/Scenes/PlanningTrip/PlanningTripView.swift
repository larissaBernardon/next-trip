//
//  PlanningTripPage.swift
//  NextTrip
//
//  Created by larissa.bernardon on 28/06/23.
//

import SwiftUI

struct PlanningTripView: View {

    @State private var date = Date()
    @Binding var isPresented: Bool

    let destination: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Selecionar datas")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 30)
                .padding(.leading, 20)

            Spacer()

            DestinationTextField(destinationName: destination)

            Spacer()

            DatePicker(
                    "Data inicial",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .accentColor(.black)
                .padding(.horizontal, 20)

            Spacer()

            Button(action: {
                isPresented = false
            }) {
                Text("Done")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct DestinationTextField: View {
    let destinationName: String

    var body: some View {
        HStack {
            Image(systemName: "map")
                .foregroundColor(.gray)

            Text(destinationName)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .foregroundColor(.gray)
        .font(.system(size: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal)
        .onTapGesture {}
        .onLongPressGesture {}
        .textContentType(.none)
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .textContentType(.oneTimeCode)
        .keyboardType(.default)
        .textContentType(.name)
        .autocapitalization(.words)
        .disableAutocorrection(true)
    }
}
