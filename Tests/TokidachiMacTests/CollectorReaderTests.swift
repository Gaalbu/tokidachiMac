import Foundation
import XCTest
@testable import TokidachiMac

final class CollectorReaderTests: XCTestCase {
    func testReadsMultiProviderFixtureAndPreservesMetadata() throws {
        let data = try fixture("multi-provider.json")
        let document = try CollectorReader().read(data: data)

        XCTAssertEqual(document.version, 1)
        XCTAssertEqual(document.providers["claude"]?.displayName, "Claude")
        XCTAssertEqual(document.providers["codex"]?.status, "attention")
        XCTAssertEqual(document.providers["codex"]?.windows.first?.usedPercent, 91)
    }

    func testRejectsUnsupportedContractVersion() throws {
        let data = Data(#"{"version":2,"updatedAt":1,"providers":{}}"#.utf8)

        XCTAssertThrowsError(try CollectorReader().read(data: data)) { error in
            XCTAssertEqual(error as? CollectorReaderError, .invalidVersion(2))
        }
    }

    private func fixture(_ name: String) throws -> Data {
        let url = try XCTUnwrap(Bundle.module.url(forResource: name, withExtension: nil, subdirectory: "Fixtures"))
        return try Data(contentsOf: url)
    }
}
