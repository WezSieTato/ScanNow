@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import XCTest

final class WelcomeViewControllerTests: XCTestCase {
    func testView() {
        let sut = WelcomeViewController()

        assertSnapshot(matching: sut, as: .image(on: .iPhone13Mini))
    }

    func testView_whenAppearenceIsDark() {
        let sut = WelcomeViewController()
        sut.overrideUserInterfaceStyle = .dark

        assertSnapshot(matching: sut, as: .image(on: .iPhone13Mini))
    }
}
