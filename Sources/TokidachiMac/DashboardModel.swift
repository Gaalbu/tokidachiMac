import Foundation

public final class DashboardModel: ObservableObject {
    @Published public private(set) var document: CollectorDocument?
    @Published public private(set) var errorMessage: String?

    private let reader: CollectorReader

    public init(reader: CollectorReader = CollectorReader()) {
        self.reader = reader
    }

    public func load(data: Data) {
        do {
            document = try reader.read(data: data)
            errorMessage = nil
        } catch {
            document = nil
            errorMessage = "Unable to read collector data: \(error.localizedDescription)"
        }
    }
}
