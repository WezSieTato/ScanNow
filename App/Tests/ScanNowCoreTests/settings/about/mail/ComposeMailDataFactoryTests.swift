@testable import ScanNowCore
import SnapshotTesting
import Testing

@Suite(.snapshots(record: .missing))
struct ComposeMailDataFactoryTests {
    private let sut: ComposeMailDataFactory
    private let appVersioning: VersioningMock
    private let systemVersioning: SystemVersioningMock

    init() {
        appVersioning = VersioningMock()
        appVersioning.versionNumber = "1.0"
        appVersioning.buildNumber = "1"
        systemVersioning = SystemVersioningMock()
        systemVersioning.systemName = "iOS"
        systemVersioning.systemVersion = "16.1"
        sut = ComposeMailDataFactory(appVersioning: appVersioning, systemVersioning: systemVersioning)
    }

    @Test func subject() {
        let result = sut.make()

        #expect(result.subject == "Feedback for ScanNow")
    }

    @Test func recipients() {
        let result = sut.make()

        #expect(result.recipients == ["marcin.stepnowski@gmail.com"])
    }

    @Test func message_whenVersionIs1_0_buildIs1_systemNameIsIOS_systemVersionIs16_1() {
        assertSnapshot(of: sut.make().message, as: .description)
    }

    @Test func message_whenVersionIs1_9_buildIs1_systemNameIsIOS_systemVersionIs16_1() {
        appVersioning.versionNumber = "1.9"

        assertSnapshot(of: sut.make().message, as: .description)
    }

    @Test func message_whenVersionIs1_0_buildIs1410_systemNameIsIOS_systemVersionIs16_1() {
        appVersioning.buildNumber = "1410"

        assertSnapshot(of: sut.make().message, as: .description)
    }

    @Test func message_whenVersionIs1_0_buildIs1_systemNameIsIPadOS_systemVersionIs16_1() {
        systemVersioning.systemName = "iPadOS"

        assertSnapshot(of: sut.make().message, as: .description)
    }

    @Test func message_whenVersionIs1_0_buildIs1_systemNameIsIOS_systemVersionIs13_1() {
        systemVersioning.systemVersion = "13.1"

        assertSnapshot(of: sut.make().message, as: .description)
    }
}
