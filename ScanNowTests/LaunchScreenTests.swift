@testable import ScanNow
import SnapshotTesting
import Testing

@Suite @MainActor struct LaunchScreenSnapshotTests {
    private let sut: UIViewController

    init() {
        let bundle = Bundle(for: AppDelegate.self)
        let storyboard = UIStoryboard(name: "LaunchScreen", bundle: bundle)
        sut = storyboard.instantiateInitialViewController()!
    }

    @Test func testViewOnSmallIPhone() {
        assertSnapshot(of: sut, as: .image(on: .iPhoneSe))
    }

    @Test func testViewOnIPhone8() {
        assertSnapshot(of: sut, as: .image(on: .iPhone8))
    }

    @Test func testViewOnLargeIPhone() {
        assertSnapshot(of: sut, as: .image(on: .iPhone13ProMax))
    }

    @Test func testViewOnIPhoneWithDarkAppearance() {
        sut.overrideUserInterfaceStyle = .dark
        assertSnapshot(of: sut, as: .image(on: .iPhone8))
    }
}
