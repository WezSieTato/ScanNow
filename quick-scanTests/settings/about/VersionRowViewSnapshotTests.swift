@testable import quick_scan
import SnapshotTesting
import SwiftUI
import XCTest

final class VersionRowViewSnapshotTests: XCTestCase {
    func testView_whenVersionIs1_0_0andBuildNumber1() {
        testView(version: "1.0.0", buildNumber: "1")
    }

    func testView_whenVersionIs1_0_0andBuildNumber2() {
        testView(version: "1.0.0", buildNumber: "2")
    }

    func testView_whenVersionIs2_1_3andBuildNumber7() {
        testView(version: "2.1.3", buildNumber: "7")
    }

    private func testView(
        version: String,
        buildNumber: String,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        let versioning = VersioningMock()
        versioning.versionNumber = version
        versioning.buildNumber = buildNumber
        let sut = Form {
            VersionRowView(version: versioning)
        }

        assertSnapshot(
            matching: sut,
            as: .image(layout: .fixed(width: 375, height: 90)),
            record: false,
            file: file,
            testName: testName,
            line: line
        )
    }
}
