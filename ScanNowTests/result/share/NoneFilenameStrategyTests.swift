@testable import ScanNow
import XCTest

final class NoneFilenameStrategyTests: XCTestCase {
    private func testFilename(
        settingsFileName: String,
        expectedFilename: String,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let sut = NoneFilenameStrategy()
        let fileSettings = FileSettingsMock()
        fileSettings.filename = settingsFileName

        let result = sut.filename(settings: fileSettings)

        XCTAssertEqual(result, expectedFilename, file: file, line: line)
    }

    func testFilename_whenSettingsFileNameIsExample() {
        testFilename(settingsFileName: "Example", expectedFilename: "Example")
    }

    func testFilename_whenSettingsFileNameIsScan() {
        testFilename(settingsFileName: "Scan", expectedFilename: "Scan")
    }

    func testFilename_whenSettingsFileNameIsEmptyString() {
        testFilename(settingsFileName: "", expectedFilename: "Scan")
    }
}
