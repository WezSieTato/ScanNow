@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import XCTest

final class AboutSettingsSectionViewSnapshotTests: XCTestCase {
    func testView() {
        let sut = Form {
            AboutSettingsSectionView(version: PreviewVersion())
        }
        assertSnapshot(matching: sut, as: .image(layout: .fixed(width: 375, height: 180)))
    }
}
