import DataDrivenTesting
@testable import ScanNow
import SnapshotTesting
import SwiftUI
import XCTest

final class VersionRowViewSnapshotTests: XCTestCase {
    func testView() {
        dataTests([
            TestData((version: "1.0.0", buildNumber: "1")),
            TestData((version: "1.0.0", buildNumber: "2")),
            TestData((version: "2.1.3", buildNumber: "7")),

        ]) { testData, activity in
            let versioning = VersioningMock()
            versioning.versionNumber = testData.data.version
            versioning.buildNumber = testData.data.buildNumber
            let sut = Form {
                VersionRowView(version: versioning)
            }

            assertSnapshot(
                matching: sut,
                as: .image(layout: .fixed(width: 375, height: 90)),
                record: false,
                file: testData.file,
                testName: activity.name,
                line: testData.line
            )
        }
    }
}
