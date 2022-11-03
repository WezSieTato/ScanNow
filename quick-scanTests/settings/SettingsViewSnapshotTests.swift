@testable import quick_scan
import SnapshotTesting
import XCTest

final class SettingsViewSnapshotTests: XCTestCase {
    private var userDefaults: UserDefaults!
    private var sut: UIViewController!

    override func setUp() {
        super.setUp()

        userDefaults = UserDefaults(suiteName: "SettingsViewSnapshotTests")
        sut = SettingsViewControllerFactory.create(
            userDefaults: userDefaults,
            version: MockVersioning(versionNumber: "1.0.0", buildNumber: "1")
        )
    }

    override func tearDown() {
        super.tearDown()

        sut = nil
        userDefaults = nil
    }

    func testView_whenSettingsAreDefault() {
        assertSnapshot(matching: sut, as: .image(on: .iPhone13Mini))
    }
}
