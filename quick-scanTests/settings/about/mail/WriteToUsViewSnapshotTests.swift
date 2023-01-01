@testable import quick_scan
import SnapshotTesting
import SwiftUI
import XCTest

final class WriteToUsViewSnapshotTests: XCTestCase {
    func testView() {
        let sut = Form {
            WriteToUsView()
        }

        assertSnapshot(matching: sut, as: .image(layout: .fixed(width: 375, height: 90)))
    }
}
