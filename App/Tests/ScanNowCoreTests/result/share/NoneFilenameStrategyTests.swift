@testable import ScanNowCore
import Testing

@Suite struct NoneFilenameStrategyTests {
    @Test(arguments: [
        ("Example", "Example"),
        ("Scan", "Scan"),
        ("", "Scan"),
    ])
    func testFilename(settingsFilename: String, expected: String) {
        let sut = NoneFilenameStrategy()
        let fileSettings = FileSettingsMock()
        fileSettings.filename = settingsFilename

        let result = sut.filename(settings: fileSettings)

        #expect(result == expected)
    }
}
