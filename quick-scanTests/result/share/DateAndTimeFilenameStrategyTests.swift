@testable import quick_scan
import XCTest

final class DateAndTimeFilenameStrategyTests: XCTestCase {
    private var sut: DateAndTimeFilenameStrategy!
    private var timeProvider: TimeProviderMock!
    private var fileSettings: FileSettingsMock!

    private func date(year: Int = 1991, month: Int = 8, day: Int = 16, hour: Int = 0, minute: Int = 0) -> Date {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!

        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute

        let date = gregorianCalendar.date(from: dateComponents)!
        return date
    }

    override func setUp() {
        super.setUp()
        timeProvider = TimeProviderMock()
        timeProvider.nowReturnValue = date()
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

        timeProvider.nowReturnValue = date(year: 2005, month: 4, day: 2, hour: 21, minute: 37)

        XCTAssertEqual(sut.filename(settings: fileSettings), "Example_02-04-2005-21:37")
    }

    func testFilename_whenSettingsFilenameIsScan() {
        fileSettings.filename = "Scan"

        XCTAssertEqual(sut.filename(settings: fileSettings), "Scan_16-08-1991-00:00")
    }
}
