import Foundation

public struct Trip: Codable {
    let id: String
    let destination: Destination
    let plan: TripPlan

    init(id: String, destination: Destination, plan: TripPlan) {
        self.id = id
        self.destination = destination
        self.plan = plan
    }

    enum CodingKeys: String, CodingKey {
        case id
        case destination
        case plan
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.destination = try container.decode(Destination.self, forKey: .destination)
        self.plan = try container.decode(TripPlan.self, forKey: .plan)
    }
}
