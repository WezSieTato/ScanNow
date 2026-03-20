import Foundation
import Mocking
@testable import ScanNowCore
import Testing

struct DateAndTimeFilenameStrategyTests {
    private let sut: DateAndTimeFilenameStrategy
    private let timeProvider: TimeProviderMock
    private let fileSettings: FileSettingsMock

    init() {
        timeProvider = TimeProviderMock()
        timeProvider._now.implementation = .returns(Date.date())
        sut = DateAndTimeFilenameStrategy(timeProvider: timeProvider)
        fileSettings = FileSettingsMock()
    }

    @Test func filename_whenSettingsFilenameIsExample() {
        fileSettings._filename.getter.implementation = .returns("Example")

        #expect(sut.filename(settings: fileSettings) == "Example_16-08-1991-00:00")
    }

    @Test func filename_whenSettingsFilenameIsExample_andDifferentDate() {
        fileSettings._filename.getter.implementation = .returns("Example")

        timeProvider._now.implementation = .returns(Date.date(year: 2005, month: 4, day: 2, hour: 21, minute: 37))

        #expect(sut.filename(settings: fileSettings) == "Example_02-04-2005-21:37")
    }

    @Test func filename_whenSettingsFilenameIsScan() {
        fileSettings._filename.getter.implementation = .returns("Scan")

        #expect(sut.filename(settings: fileSettings) == "Scan_16-08-1991-00:00")
    }
}
