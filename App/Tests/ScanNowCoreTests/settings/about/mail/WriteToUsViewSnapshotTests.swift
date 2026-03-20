import Mocking
@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import Testing

@Suite(.snapshots(record: .missing))
@MainActor
struct WriteToUsViewSnapshotTests {
    @Test func view() {
        let appVersioning = VersioningMock()
        appVersioning._versionNumber.getter.implementation = .returns("1.0")
        appVersioning._buildNumber.getter.implementation = .returns("1")
        let systemVersioning = SystemVersioningMock()
        systemVersioning._systemName.getter.implementation = .returns("iOS")
        systemVersioning._systemVersion.getter.implementation = .returns("16.1")
        let mailComposer = ComposeMailDataFactory(appVersioning: appVersioning, systemVersioning: systemVersioning)

        let sut = Form {
            WriteToUsView(composeMailDataFactory: mailComposer)
        }

        assertSnapshot(of: sut, as: .image(layout: .fixed(width: 375, height: 90)))
    }
}
