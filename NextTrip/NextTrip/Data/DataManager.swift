import Foundation

class DataManager: ObservableObject {
    static let tripsKey = "tripsKey"

    @Published var currentTrip: Trip?
    @Published var allTrips: [Trip] = []


    // MARK: - Methods

    static func saveTrip(_ trip: Trip) {
        var trips = getAllTrips()
        trips.append(trip)
        saveAllTrips(trips)
    }

    static func getCurrentTrips() -> Trip? {
        let trips = getAllTrips()
        let currentDate = Date()

        let currentTrips = trips.filter { trip in
            let startDate = trip.plan.dates.startDate
            if let date = dateFromString(startDate, format: "dd/MM/yyyy") {
                return Calendar.current.isDate(date, inSameDayAs: currentDate)
            }

            return false
        }

        return currentTrips.isEmpty ? nil : currentTrips.first
    }

    static func getUpcomingTrips() -> [Trip]? {
        let trips = getAllTrips()
        let currentDate = Date()

        let upcomingTrips = trips.filter { trip in
            let startDate = trip.plan.dates.startDate

            if let date = dateFromString(startDate, format: "dd/MM/yyyy") {
                return date > currentDate
            }

            return false
        }

        return upcomingTrips.isEmpty ? nil : upcomingTrips
    }

    static func dateFromString(_ dateString: String, format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString)
    }

    static func getTripById(_ id: String) -> Trip? {
        let trips = getAllTrips()
        return trips.first { $0.id == id }
    }

    static func getAllTrips() -> [Trip] {
        if let data = UserDefaults.standard.data(forKey: tripsKey) {
            do {
                let decoder = JSONDecoder()
                let trips = try decoder.decode([Trip].self, from: data)
                return trips
            } catch {
                print("Error decoding trips: \(error)")
            }
        }
        return []
    }

    private static func saveAllTrips(_ trips: [Trip]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(trips)
            UserDefaults.standard.set(data, forKey: tripsKey)
        } catch {
            print("Error encoding trips: \(error)")
        }
    }

    private func updateCurrentTrips() {
        DispatchQueue.main.async {
            self.currentTrip = DataManager.getCurrentTrips()
        }
    }

    private func updateAllTrips() {
        DispatchQueue.main.async {
            self.allTrips = DataManager.getAllTrips()
        }
    }

    static func clearUserDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()

        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
