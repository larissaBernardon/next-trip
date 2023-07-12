import Foundation

public struct Trip: Codable {
    let destination: Destination
    let plan: TripPlan

    init(destination: Destination, plan: TripPlan) {
        self.destination = destination
        self.plan = plan
    }

    enum CodingKeys: String, CodingKey {
        case destination
        case plan
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.destination = try container.decode(Destination.self, forKey: .destination)
        self.plan = try container.decode(TripPlan.self, forKey: .plan)
    }
}
