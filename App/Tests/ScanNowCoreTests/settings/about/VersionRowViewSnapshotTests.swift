@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import Testing

@Suite(.snapshots(record: .missing)) @MainActor struct VersionRowViewSnapshotTests {
    @Test(arguments: [
        ("1.0.0", "1"),
        ("1.0.0", "2"),
        ("2.1.3", "7"),
    ])
    func view(version: String, buildNumber: String) {
        let versioning = VersioningMock()
        versioning.versionNumber = version
        versioning.buildNumber = buildNumber
        let sut = Form {
            VersionRowView(version: versioning)
        }

        let sanitizedVersion = version.replacingOccurrences(of: ".", with: "-")
        assertSnapshot(
            of: sut,
            as: .image(layout: .fixed(width: 375, height: 90)),
            testName: "When-data-is-version-\(sanitizedVersion)-buildNumber-\(buildNumber)"
        )
    }
}
