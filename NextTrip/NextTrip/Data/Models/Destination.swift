//
//  Destination.swift
//  NextTrip
//
//  Created by larissa.bernardon on 12/07/23.
//

import Foundation

public struct Destination: Codable, Equatable {

    // MARK: - Properties

    let name: String
    let country: String
    let countryCode: String
    let bioSummary: String
    let imageName: String
    let history: String
    let geography: String
    let language: String
    let currency: String
    let bestTimeToVisit: String

    // MARK: - Initializer

    public init(
        name: String,
        country: String,
        countryCode: String,
        bioSummary: String,
        imageName: String,
        history: String,
        geography: String,
        language: String,
        currency: String,
        bestTimeToVisit: String
    ) {
        self.name = name
        self.country = country
        self.countryCode = countryCode
        self.bioSummary = bioSummary
        self.imageName = imageName
        self.history = history
        self.geography = geography
        self.language = language
        self.currency = currency
        self.bestTimeToVisit = bestTimeToVisit
    }

    enum CodingKeys: String, CodingKey {
        case name
        case country
        case countryCode
        case bioSummary
        case imageName
        case history
        case geography
        case language
        case currency
        case bestTimeToVisit
    }

    // MARK: - Initializer from decoder

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.country = try container.decode(String.self, forKey: .country)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.bioSummary = try container.decode(String.self, forKey: .bioSummary)
        self.imageName = try container.decode(String.self, forKey: .imageName)
        self.history = try container.decode(String.self, forKey: .history)
        self.geography = try container.decode(String.self, forKey: .geography)
        self.language = try container.decode(String.self, forKey: .language)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.bestTimeToVisit = try container.decode(String.self, forKey: .bestTimeToVisit)
    }
}
