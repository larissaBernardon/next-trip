//
//  PlanningTripPage.swift
//  NextTrip
//
//  Created by larissa.bernardon on 28/06/23.
//

import SwiftUI

struct PlanningTripView: View {

    @State private var dates: Set<DateComponents> = []
    @State private var startDate: Date?
    @State private var endDate: Date?
    @State private var dateSelectionState: DateSelectionState = .none

    @Binding var isPresented: Bool

    let destination: String

    enum DateSelectionState {
        case none
        case startSelected
        case endSelected
    }

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

            if #available(iOS 16.0, *) {
                MultiDatePicker("Dates Available", selection: $dates, in: Date()...)
                    .datePickerStyle(.graphical)
                    .padding()
                    .tint(.black)
                    .foregroundColor(.green)
                    .accentColor(.yellow)
                    .onChange(of: dates, perform: { value in
                        print("VALUE: \(value)")
                        processDateSelection()
                    })


            } else {
                // Fallback on earlier versions
            }

            Spacer()

            Button(action: {
                // request para gerar itnerário
                // dismiss no sucesso
                print(startDate)
                print(endDate)
                isPresented = false
            }) {
                Text("Gerar itnerário")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(dates.count < 2 ? Color.gray : Color.black)
                    .cornerRadius(10)
            }
            .disabled(dates.count < 2)
            .padding()
        }
    }

    private func processDateSelection() {
        guard let lastDateComponent = dates.sorted(by: { $0.date ?? Date.distantPast < $1.date ?? Date.distantPast }).last,
            let selectedDate = lastDateComponent.date else { return }


        guard dates.count < 3 else {
            clearDates()
            return
        }

        if let startDate = startDate {
            if selectedDate > startDate {
                endDate = selectedDate
            } else {
                clearDates()
                return
            }
        } else {
            startDate = selectedDate
        }
    }

    private func clearDates() {
        dates.removeAll()
        startDate = nil
        endDate = nil
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
        .autocapitalization(.none)
        .textContentType(.name)
    }
}


