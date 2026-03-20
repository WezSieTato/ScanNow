import Mocking
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
        fileSettings._filename.getter.implementation = .returns(settingsFilename)

        let result = sut.filename(settings: fileSettings)

        #expect(result == expected)
    }
}
