@testable import quick_scan
import XCTest

final class DateAndTimeFilenameStrategyTests: XCTestCase {
    private var sut: DateAndTimeFilenameStrategy!
    private var timeProvider: MockTimeProvider!

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
        timeProvider = MockTimeProvider(date: date())
        sut = DateAndTimeFilenameStrategy(timeProvider: timeProvider)
    }

    override func tearDown() {
        sut = nil
        timeProvider = nil
        super.tearDown()
    }

    func testFilename_whenPrefixIsExample() {
        XCTAssertEqual(sut.filename(prefix: "Example"), "Example_16-08-1991-00:00")
    }

    func testFilename_whenPrefixIsExample_andDifferentDate() {
        timeProvider.date = date(year: 2005, month: 4, day: 2, hour: 21, minute: 37)

        XCTAssertEqual(sut.filename(prefix: "Example"), "Example_02-04-2005-21:37")
    }

    func testFilename_whenPrefixIsScan() {
        XCTAssertEqual(sut.filename(prefix: "Scan"), "Scan_16-08-1991-00:00")
    }
}
