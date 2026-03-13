@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import Testing

@Suite(.snapshots(record: .missing)) @MainActor struct GithubRowViewSnapshotTests {
    @Test func view() {
        let sut = Form {
            GithubRowView()
        }

        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 375, height: 90)))
    }
}
