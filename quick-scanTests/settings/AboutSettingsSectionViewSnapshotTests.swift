@testable import quick_scan
import SnapshotTesting
import SwiftUI
import XCTest

final class AboutSettingsSectionViewSnapshotTests: XCTestCase {
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
        let versioning = MockVersioning(versionNumber: version, buildNumber: buildNumber)
        let sut = Form {
            AboutSettingsSectionView(version: versioning)
        }

        assertSnapshot(
            matching: sut,
            as: .image(layout: .fixed(width: 375, height: 140)),
            record: false,
            file: file,
            testName: testName,
            line: line
        )
    }
}
