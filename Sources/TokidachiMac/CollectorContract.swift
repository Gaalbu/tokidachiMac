import Foundation

public struct CollectorDocument: Codable, Equatable {
    public let version: Int
    public let updatedAt: Int64
    public let providers: [String: ProviderCard]
}

public struct ProviderCard: Codable, Equatable, Identifiable {
    public let id: String
    public let displayName: String
    public let color: String
    public let pet: String
    public let status: String
    public let configured: Bool
    public let windows: [UsageWindow]
    public let notices: [String]
    public let message: String?

    enum CodingKeys: String, CodingKey {
        case displayName, color, pet, status, configured, windows, notices, message
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try container.decode(String.self, forKey: .displayName)
        color = try container.decode(String.self, forKey: .color)
        pet = try container.decode(String.self, forKey: .pet)
        status = try container.decode(String.self, forKey: .status)
        configured = try container.decode(Bool.self, forKey: .configured)
        windows = try container.decode([UsageWindow].self, forKey: .windows)
        notices = try container.decode([String].self, forKey: .notices)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        id = decoder.codingPath.last?.stringValue ?? "unknown"
    }
}

public struct UsageWindow: Codable, Equatable, Identifiable {
    public let id = UUID()
    public let label: String
    public let usedPercent: Double
    public let resetLabel: String?

    enum CodingKeys: String, CodingKey { case label, usedPercent, resetLabel }
}
