@testable import ScanNow
import SnapshotTesting
import XCTest

final class LaunchScreenSnapshotTests: XCTestCase {
    var sut: UIViewController!

    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: AppDelegate.self)
        let storyboard = UIStoryboard(name: "LaunchScreen", bundle: bundle)
        sut = storyboard.instantiateInitialViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testView(
        on config: ViewImageConfig,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        assertSnapshot(of: sut, as: .image(on: config), file: file, testName: testName, line: line)
    }

    func testViewOnSmallIPhone() {
        testView(on: .iPhoneSe)
    }

    func testViewOnIPhone8() {
        testView(on: .iPhone8)
    }

    func testViewOnLargeIPhone() {
        testView(on: .iPhone13ProMax)
    }

    func testViewOnIPhoneWithDarkAppearance() {
        sut.overrideUserInterfaceStyle = .dark
        testView(on: .iPhone8)
    }
}
