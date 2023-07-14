//
//  TripPlan.swift
//  NextTrip
//
//  Created by larissa.bernardon on 12/07/23.
//

import Foundation

struct TripPlan: Codable {
    let dates: TripDates
    let days: [Day]

    init(dates: TripDates, days: [Day]) {
        self.dates = dates
        self.days = days
    }

    enum CodingKeys: String, CodingKey {
        case dates
        case days
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dates = try container.decode(TripDates.self, forKey: .dates)
        self.days = try container.decode([Day].self, forKey: .days)
    }
}

struct Day: Codable {
    let day: String
    let activities: [Activity]

    init(day: String, activities: [Activity]) {
        self.day = day
        self.activities = activities
    }

    enum CodingKeys: String, CodingKey {
        case day
        case activities
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.day = try container.decode(String.self, forKey: .day)
        self.activities = try container.decode([Activity].self, forKey: .activities)
    }
}

struct TripDates: Codable {
    let startDate: Date
    let endDate: Date

    init(startDate: Date, endDate: Date) {
        self.startDate = startDate
        self.endDate = endDate
    }

    enum CodingKeys: String, CodingKey {
        case startDate
        case endDate
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"

        let startDateString = try container.decode(String.self, forKey: .startDate)
        if let startDate = dateFormatter.date(from: startDateString) {
            self.startDate = startDate
        } else {
            throw DecodingError.dataCorruptedError(forKey: .startDate,
                                                   in: container,
                                                   debugDescription: "Invalid start date format")
        }

        let endDateString = try container.decode(String.self, forKey: .endDate)
        if let endDate = dateFormatter.date(from: endDateString) {
            self.endDate = endDate
        } else {
            throw DecodingError.dataCorruptedError(forKey: .endDate,
                                                   in: container,
                                                   debugDescription: "Invalid end date format")
        }
    }
}

struct Activity: Codable {
    let title: String
    let description: String
    let location: Location

    init(title: String, description: String, location: Location) {
        self.title = title
        self.description = description
        self.location = location
    }

    enum CodingKeys: String, CodingKey {
        case title
        case description
        case location
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        location = try container.decode(Location.self, forKey: .location)
    }
}

struct Location: Codable {
    let latitude: Double
    let longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
    }
}
