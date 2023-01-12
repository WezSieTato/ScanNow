@testable import ScanNow
import SnapshotTesting
import XCTest

final class ComposeMailDataFactoryTests: XCTestCase {
    private var sut: ComposeMailDataFactory!
    private var appVersioning: VersioningMock!
    private var systemVersioning: SystemVersioningMock!

    override func setUp() {
        super.setUp()

        appVersioning = VersioningMock()
        appVersioning.versionNumber = "1.0"
        appVersioning.buildNumber = "1"
        systemVersioning = SystemVersioningMock()
        systemVersioning.systemName = "iOS"
        systemVersioning.systemVersion = "16.1"
        sut = ComposeMailDataFactory(appVersioning: appVersioning, systemVersioning: systemVersioning)
    }

    func testSubject() {
        let result = sut.make()

        XCTAssertEqual(result.subject, "Feedback for Scan Only")
    }

    func testRecipients() {
        let result = sut.make()

        XCTAssertEqual(result.recipients, ["marcin.stepnowski@gmail.com"])
    }

    func testMessage_whenVersionIs1_0_buildIs1_systemNameIsIOS_systemVersionIs16_1() {
        testMessage()
    }

    func testMessage_whenVersionIs1_9_buildIs1_systemNameIsIOS_systemVersionIs16_1() {
        appVersioning.versionNumber = "1.9"

        testMessage()
    }

    func testMessage_whenVersionIs1_0_buildIs1410_systemNameIsIOS_systemVersionIs16_1() {
        appVersioning.buildNumber = "1410"

        testMessage()
    }

    func testMessage_whenVersionIs1_0_buildIs1_systemNameIsIPadOS_systemVersionIs16_1() {
        systemVersioning.systemName = "iPadOS"

        testMessage()
    }

    func testMessage_whenVersionIs1_0_buildIs1_systemNameIsIOS_systemVersionIs13_1() {
        systemVersioning.systemVersion = "13.1"

        testMessage()
    }

    private func testMessage(
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        let result = sut.make()

        assertSnapshot(matching: result.message, as: .description, file: file, testName: testName, line: line)
    }
}
