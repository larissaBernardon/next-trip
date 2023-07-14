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
    @State private var selectedPreferences: Set<String> = []
    @Binding var isPresented: Bool

    @Binding var createdTrip: Trip?
    let destination: Destination

    init(isPresented: Binding<Bool>, destination: Destination, createdTrip: Binding<Trip?>) {
        self._isPresented = isPresented
        self.destination = destination
        self._createdTrip = createdTrip
    }

    let options = ["Cultura", "Natureza", "Economica", "Luxo", "Experiências gastronomicas", "Esportes"]

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
                .padding(.top, 20)
                .padding(.leading, 20)
            
            DestinationTextField(destinationName: "\(destination.name), \(destination.country)")

            Text("Preferências da viagem")
                .font(.system(size: 17, weight: .bold))
                .fontWeight(.semibold)
                .padding(.leading)
                .padding(.top, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            toggleOption(option)
                        }) {
                            Text(option)
                                .font(.system(size: 14))
                                .foregroundColor(selectedPreferences.contains(option) ? .white : .black)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(selectedPreferences.contains(option) ? Color.black : Color.white)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: selectedPreferences.contains(option) ? 0 : 1)
                                )
                        }
                    }
                }
                .padding(.vertical, 5)
            }
            .padding(.leading, 17)

            if #available(iOS 16.0, *) {
                MultiDatePicker("Dates Available", selection: $dates, in: Date()...)
                    .datePickerStyle(.graphical)
                    .padding(.horizontal)
                    .tint(.black)
                    .foregroundColor(.green)
                    .accentColor(.yellow)
                    .onChange(of: dates, perform: { value in
                        processDateSelection()
                    })


            } else {
                // Fallback on earlier versions
            }

            Button(action: {
                try? createTripPlanAndSaveLocal()
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

    private func createTripPlanAndSaveLocal() throws {
        guard let startDate = startDate,
              let endDate = endDate else { return }

        guard let jsonURL = Bundle.main.url(forResource: "TripPlan\(destination.name.replacingOccurrences(of: " ", with: ""))", withExtension: "json") else {
            print("TripPlan\(destination.name.replacingOccurrences(of: " ", with: ""))")
            print("json não encontrado")
            return
        }

        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            let tripPlan = try decoder.decode(TripPlan.self, from: jsonData)

            let trip = Trip(
                id: "\(destination.name)\(startDate)",
                destination: destination,
                plan: tripPlan
            )

            DataManager.saveTrip(trip)
            createdTrip = trip
            isPresented = false

        } catch {
            print(error)
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

    func toggleOption(_ option: String) {
        if selectedPreferences.contains(option) {
            selectedPreferences.remove(option)
        } else {
            selectedPreferences.insert(option)
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
        .autocapitalization(.none)
        .textContentType(.name)
    }
}


