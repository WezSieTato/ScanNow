@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import Testing

@Suite(.snapshots(record: .missing))
@MainActor
struct WelcomeViewControllerTests {
    @Test func view() {
        let sut = WelcomeViewController()

        assertSnapshot(of: sut, as: .image(on: .iPhone13Mini))
    }

    @Test func view_whenAppearenceIsDark() {
        let sut = WelcomeViewController()
        sut.overrideUserInterfaceStyle = .dark

        assertSnapshot(of: sut, as: .image(on: .iPhone13Mini))
    }
}
