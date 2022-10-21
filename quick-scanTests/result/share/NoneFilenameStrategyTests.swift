@testable import quick_scan
import XCTest

final class NoneFilenameStrategyTests: XCTestCase {
    private var sut: NoneFilenameStrategy!

    override func setUp() {
        super.setUp()
        sut = NoneFilenameStrategy()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testFilename_whenPrefixIsExample() {
        XCTAssertEqual(sut.filename(prefix: "Example"), "Example")
    }

    func testFilename_whenPrefixIsScan() {
        XCTAssertEqual(sut.filename(prefix: "Scan"), "Scan")
    }
}
