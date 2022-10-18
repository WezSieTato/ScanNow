@testable import quick_scan
import SnapshotTesting
import SwiftUI
import XCTest

final class AboutSettingsSectionViewSnapshotTests: XCTestCase {
    private var sut: AboutSettingsSectionView!

    func testView() {
        let sut = Form {
            AboutSettingsSectionView()
        }

        assertSnapshot(matching: sut,
                       as: .image(layout: .fixed(width: 375, height: 100)),
                       record: false)
    }
}
