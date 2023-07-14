//
//  DestinationList.swift
//  NextTrip
//
//  Created by larissa.bernardon on 12/07/23.
//

import Foundation

struct DestinationList: Codable {
    let destinations: [Destination]

    enum CodingKeys: String, CodingKey {
        case destinations
    }

    init(destinations: [Destination]) {
        self.destinations = destinations
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.destinations = try container.decode([Destination].self, forKey: .destinations)
    }
}
