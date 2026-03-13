@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import Testing

@Suite @MainActor struct AboutSettingsSectionViewSnapshotTests {
    @Test func testView() {
        let sut = Form {
            AboutSettingsSectionView(version: PreviewVersion())
        }
        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 375, height: 180)))
    }
}
