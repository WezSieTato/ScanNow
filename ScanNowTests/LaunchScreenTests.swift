@testable import ScanNow
import SnapshotTesting
import Testing
import UIKit

@Suite(.snapshots(record: .missing))
@MainActor
struct LaunchScreenSnapshotTests {
    private let sut: UIViewController

    init() {
        let bundle = Bundle(for: AppDelegate.self)
        let storyboard = UIStoryboard(name: "LaunchScreen", bundle: bundle)
        sut = storyboard.instantiateInitialViewController()!
    }

    @Test func viewOnSmallIPhone() {
        assertSnapshot(of: sut, as: .image(on: .iPhoneSe))
    }

    @Test func viewOnIPhone8() {
        assertSnapshot(of: sut, as: .image(on: .iPhone8))
    }

    @Test func viewOnLargeIPhone() {
        assertSnapshot(of: sut, as: .image(on: .iPhone13ProMax))
    }

    @Test func viewOnIPhoneWithDarkAppearance() {
        sut.overrideUserInterfaceStyle = .dark
        assertSnapshot(of: sut, as: .image(on: .iPhone8))
    }
}
