import Foundation

public enum CollectorReaderError: Error, Equatable {
    case invalidVersion(Int)
    case noConfiguredProviders
}

public struct CollectorReader {
    private let decoder: JSONDecoder

    public init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }

    public func read(data: Data) throws -> CollectorDocument {
        let document = try decoder.decode(CollectorDocument.self, from: data)
        guard document.version == 1 else { throw CollectorReaderError.invalidVersion(document.version) }
        return document
    }

    public func read(file url: URL) throws -> CollectorDocument {
        try read(data: Data(contentsOf: url))
    }
}
