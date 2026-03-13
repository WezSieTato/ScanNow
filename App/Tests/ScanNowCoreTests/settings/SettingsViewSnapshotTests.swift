@testable import ScanNowCore
import SnapshotTesting
import Testing

@Suite @MainActor struct SettingsViewSnapshotTests {
    private let userDefaults: UserDefaults
    private let sut: UIViewController

    init() {
        userDefaults = UserDefaults(suiteName: "SettingsViewSnapshotTests")!
        let versioning = VersioningMock()
        versioning.versionNumber = "1.0.0"
        versioning.buildNumber = "1"
        sut = SettingsViewControllerFactory.create(
            userDefaults: userDefaults,
            version: versioning
        )
    }

    @Test func testView_whenSettingsAreDefault() {
        assertSnapshot(of: sut, as: .image(on: .iPhone13Mini))
    }

    @Test func testView_whenAppearanceIsDark() {
        sut.overrideUserInterfaceStyle = .dark

        assertSnapshot(of: sut, as: .image(on: .iPhone13Mini))
    }
}
