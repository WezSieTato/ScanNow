@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import Testing

@Suite(.snapshots(record: .missing)) struct AboutSettingsSectionViewSnapshotTests {
    @Test func view() {
        let sut = Form {
            AboutSettingsSectionView(version: PreviewVersion())
        }
        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 375, height: 180)))
    }
}
