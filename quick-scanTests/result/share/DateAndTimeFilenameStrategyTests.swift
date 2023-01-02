@testable import quick_scan
import XCTest

final class DateAndTimeFilenameStrategyTests: XCTestCase {
    private var sut: DateAndTimeFilenameStrategy!
    private var timeProvider: TimeProviderMock!
    private var fileSettings: FileSettingsMock!

    override func setUp() {
        super.setUp()
        timeProvider = TimeProviderMock()
        timeProvider.nowReturnValue = Date.date()
        sut = DateAndTimeFilenameStrategy(timeProvider: timeProvider)
        fileSettings = FileSettingsMock()
    }

    override func tearDown() {
        fileSettings = nil
        sut = nil
        timeProvider = nil
        super.tearDown()
    }

    func testFilename_whenSettingsFilenameIsExample() {
        fileSettings.filename = "Example"

        XCTAssertEqual(sut.filename(settings: fileSettings), "Example_16-08-1991-00:00")
    }

    func testFilename_whenSettingsFilenameIsExample_andDifferentDate() {
        fileSettings.filename = "Example"

        timeProvider.nowReturnValue = Date.date(year: 2005, month: 4, day: 2, hour: 21, minute: 37)

        XCTAssertEqual(sut.filename(settings: fileSettings), "Example_02-04-2005-21:37")
    }

    func testFilename_whenSettingsFilenameIsScan() {
        fileSettings.filename = "Scan"

        XCTAssertEqual(sut.filename(settings: fileSettings), "Scan_16-08-1991-00:00")
    }
}
