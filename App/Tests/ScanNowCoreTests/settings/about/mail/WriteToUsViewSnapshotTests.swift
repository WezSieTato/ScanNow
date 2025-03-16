@testable import ScanNow
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
