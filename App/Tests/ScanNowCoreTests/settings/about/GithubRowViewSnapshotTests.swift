@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import XCTest

final class GithubRowViewSnapshotTests: XCTestCase {
    func testView() {
        let sut = Form {
            GithubRowView()
        }

        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 375, height: 90)))
    }
}
