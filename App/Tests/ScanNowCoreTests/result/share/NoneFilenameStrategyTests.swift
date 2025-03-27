import DataDrivenTesting
@testable import ScanNowCore
import XCTest

final class NoneFilenameStrategyTests: XCTestCase {
    func testFilename() {
        dataTests([
            TestData((settingsFileName: "Example", expected: "Example")),
            TestData((settingsFileName: "Scan", expected: "Scan")),
            TestData((settingsFileName: "", expected: "Scan"), name: "When settingsFileName is empty"),
        ]) { testData, _ in

            let sut = NoneFilenameStrategy()
            let fileSettings = FileSettingsMock()
            fileSettings.filename = testData.data.settingsFileName

            let result = sut.filename(settings: fileSettings)

            XCTAssertEqual(result, testData.data.expected, file: testData.file, line: testData.line)
        }
    }
}
