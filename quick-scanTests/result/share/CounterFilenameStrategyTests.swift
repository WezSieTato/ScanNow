@testable import quick_scan
import XCTest

final class CounterFilenameStrategyTests: XCTestCase {
    private var sut: CounterFilenameStrategy!
    private var counter: MockScanCounter!

    override func setUp() {
        super.setUp()
        counter = MockScanCounter()
        sut = CounterFilenameStrategy(counter: counter)
    }

    override func tearDown() {
        sut = nil
        counter = nil
        super.tearDown()
    }

    func testFilename_whenPrefixIsExample_andCounter0() {
        XCTAssertEqual(sut.filename(prefix: "Example"), "Example_0")
    }

    func testFilename_whenPrefixIsExample_andCounter1() {
        counter.counter = 1

        XCTAssertEqual(sut.filename(prefix: "Example"), "Example_1")
    }

    func testFilename_whenPrefixIsScan_andCounter0() {
        XCTAssertEqual(sut.filename(prefix: "Scan"), "Scan_0")
    }
}
