@testable import ScanNowCore
import XCTest

final class CounterFilenameStrategyTests: XCTestCase {
    private var sut: CounterFilenameStrategy!
    private var counter: ScanCounterMock!
    private var fileSettings: FileSettingsMock!

    override func setUp() {
        super.setUp()
        counter = ScanCounterMock()
        counter.counter = 0
        sut = CounterFilenameStrategy(counter: counter)
        fileSettings = FileSettingsMock()
    }

    override func tearDown() {
        fileSettings = nil
        sut = nil
        counter = nil
        super.tearDown()
    }

    func testFilename_whenSettingsFilenameIsExample_andCounter0() {
        fileSettings.filename = "Example"

        XCTAssertEqual(sut.filename(settings: fileSettings), "Example_0")
    }

    func testFilename_whenSettingsFilenameIsExample_andCounter1() {
        fileSettings.filename = "Example"
        counter.counter = 1

        XCTAssertEqual(sut.filename(settings: fileSettings), "Example_1")
    }

    func testFilename_whenSettingsFilenameIsScan_andCounter0() {
        fileSettings.filename = "Scan"

        XCTAssertEqual(sut.filename(settings: fileSettings), "Scan_0")
    }

    func testFilename_whenSettingsFilenameIsEmptyString_andCounter0() {
        fileSettings.filename = ""

        XCTAssertEqual(sut.filename(settings: fileSettings), "Scan_0")
    }
}
