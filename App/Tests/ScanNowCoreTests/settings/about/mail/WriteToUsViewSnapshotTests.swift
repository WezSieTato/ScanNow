@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import XCTest

final class WriteToUsViewSnapshotTests: XCTestCase {
    func testView() {
        let appVersioning = VersioningMock()
        appVersioning.versionNumber = "1.0"
        appVersioning.buildNumber = "1"
        let systemVersioning = SystemVersioningMock()
        systemVersioning.systemName = "iOS"
        systemVersioning.systemVersion = "16.1"
        let mailComposer = ComposeMailDataFactory(appVersioning: appVersioning, systemVersioning: systemVersioning)

        let sut = Form {
            WriteToUsView(composeMailDataFactory: mailComposer)
        }

        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 375, height: 90)))
    }
}
