@testable import ScanNow
import SnapshotTesting
import XCTest

final class SettingsViewSnapshotTests: XCTestCase {
    private var userDefaults: UserDefaults!
    private var sut: UIViewController!

    override func setUp() {
        super.setUp()

        userDefaults = UserDefaults(suiteName: "SettingsViewSnapshotTests")
        let versioning = VersioningMock()
        versioning.versionNumber = "1.0.0"
        versioning.buildNumber = "1"
        sut = SettingsViewControllerFactory.create(
            userDefaults: userDefaults,
            version: versioning
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

    func testView_whenAppearanceIsDark() {
        sut.overrideUserInterfaceStyle = .dark

        assertSnapshot(matching: sut, as: .image(on: .iPhone13Mini))
    }
}
