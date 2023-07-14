//
//  DataManager.swift
//  NextTrip
//
//  Created by larissa.bernardon on 14/07/23.
//

import Foundation

struct DataManager {
    static func saveTrip(_ trip: Trip) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(trip)
            UserDefaults.standard.set(data, forKey: "tripData_\(trip.id)")
        } catch {
            print("Erro ao codificar a estrutura Trip: \(error)")
        }
    }

    static func getCurrentTrips() -> [Trip]? {
        let trips = getAllTrips()
        guard !trips.isEmpty else { return nil }

        let currentDate = Date()

        let currentTrips = trips.filter { trip in
            let startDate = trip.plan.dates.startDate
            return Calendar.current.isDate(startDate, inSameDayAs: currentDate)
        }

        return currentTrips.isEmpty ? nil : currentTrips
    }

    static func getUpcomingTrips() -> [Trip]? {
        let trips = getAllTrips()
        let currentDate = Date()

        let upcomingTrips = trips.filter { trip in
            let startDate = trip.plan.dates.startDate
            return startDate > currentDate
        }

        return upcomingTrips.isEmpty ? nil : upcomingTrips
    }

    static func getTripById(_ id: String) -> Trip? {
        if let data = UserDefaults.standard.data(forKey: "tripData_\(id)") {
            do {
                let decoder = JSONDecoder()
                let trip = try decoder.decode(Trip.self, from: data)
                return trip
            } catch {
                print("Erro ao decodificar a estrutura Trip: \(error)")
            }
        }
        return nil
    }

    static func getAllTrips() -> [Trip] {
        var trips: [Trip] = []

        let userDefaults = UserDefaults.standard
        let keys = userDefaults.dictionaryRepresentation().keys
        
        for key in keys {
            if key.hasPrefix("tripData_"), let data = userDefaults.data(forKey: key) {
                do {
                    let decoder = JSONDecoder()
                    let trip = try decoder.decode(Trip.self, from: data)
                    trips.append(trip)
                } catch {
                    print("Erro ao decodificar a estrutura Trip: \(error)")
                }
            }
        }

        return trips
    }
}






