@testable import ScanNowCore
import Testing

struct NoneFilenameStrategyTests {
    @Test(arguments: [
        ("Example", "Example"),
        ("Scan", "Scan"),
        ("", "Scan"),
    ])
    func filename(settingsFilename: String, expected: String) {
        let sut = NoneFilenameStrategy()
        let fileSettings = FileSettingsMock()
        fileSettings.filename = settingsFilename

        let result = sut.filename(settings: fileSettings)

        #expect(result == expected)
    }
}
