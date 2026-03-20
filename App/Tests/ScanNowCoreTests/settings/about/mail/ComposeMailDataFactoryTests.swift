import Mocking
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
        appVersioning._versionNumber.getter.implementation = .returns("1.0")
        appVersioning._buildNumber.getter.implementation = .returns("1")
        systemVersioning = SystemVersioningMock()
        systemVersioning._systemName.getter.implementation = .returns("iOS")
        systemVersioning._systemVersion.getter.implementation = .returns("16.1")
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
        appVersioning._versionNumber.getter.implementation = .returns("1.9")

        assertSnapshot(of: sut.make().message, as: .description)
    }

    @Test func message_whenVersionIs1_0_buildIs1410_systemNameIsIOS_systemVersionIs16_1() {
        appVersioning._buildNumber.getter.implementation = .returns("1410")

        assertSnapshot(of: sut.make().message, as: .description)
    }

    @Test func message_whenVersionIs1_0_buildIs1_systemNameIsIPadOS_systemVersionIs16_1() {
        systemVersioning._systemName.getter.implementation = .returns("iPadOS")

        assertSnapshot(of: sut.make().message, as: .description)
    }

    @Test func message_whenVersionIs1_0_buildIs1_systemNameIsIOS_systemVersionIs13_1() {
        systemVersioning._systemVersion.getter.implementation = .returns("13.1")

        assertSnapshot(of: sut.make().message, as: .description)
    }
}
