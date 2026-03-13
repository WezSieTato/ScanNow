@testable import ScanNowCore
import Foundation
import Testing

@Suite struct DateAndTimeFilenameStrategyTests {
    private let sut: DateAndTimeFilenameStrategy
    private let timeProvider: TimeProviderMock
    private let fileSettings: FileSettingsMock

    init() {
        timeProvider = TimeProviderMock()
        timeProvider.nowReturnValue = Date.date()
        sut = DateAndTimeFilenameStrategy(timeProvider: timeProvider)
        fileSettings = FileSettingsMock()
    }

    @Test func testFilename_whenSettingsFilenameIsExample() {
        fileSettings.filename = "Example"

        #expect(sut.filename(settings: fileSettings) == "Example_16-08-1991-00:00")
    }

    @Test func testFilename_whenSettingsFilenameIsExample_andDifferentDate() {
        fileSettings.filename = "Example"

        timeProvider.nowReturnValue = Date.date(year: 2005, month: 4, day: 2, hour: 21, minute: 37)

        #expect(sut.filename(settings: fileSettings) == "Example_02-04-2005-21:37")
    }

    @Test func testFilename_whenSettingsFilenameIsScan() {
        fileSettings.filename = "Scan"

        #expect(sut.filename(settings: fileSettings) == "Scan_16-08-1991-00:00")
    }
}
