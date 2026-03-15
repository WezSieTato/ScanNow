import XCTest

@MainActor
final class AppStoreSnapshotsLaunchTests: XCTestCase {
    func testWelcomeScreen() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        snapshot("01WelcomeScreen")
    }
}
