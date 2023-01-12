@testable import ScanNow
import SnapshotTesting
import SwiftUI
import XCTest

final class NoCameraAccessViewTests: XCTestCase {
    func testView() {
        let sut = NoCameraAccessView()

        assertSnapshot(matching: sut, as: .image(layout: .fixed(width: 375, height: 812)))
    }
}
