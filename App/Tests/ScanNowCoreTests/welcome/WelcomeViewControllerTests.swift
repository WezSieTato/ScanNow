@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import Testing

@Suite @MainActor struct WelcomeViewControllerTests {
    @Test func testView() {
        let sut = WelcomeViewController()

        assertSnapshot(of: sut, as: .image(on: .iPhone13Mini))
    }

    @Test func testView_whenAppearenceIsDark() {
        let sut = WelcomeViewController()
        sut.overrideUserInterfaceStyle = .dark

        assertSnapshot(of: sut, as: .image(on: .iPhone13Mini))
    }
}
