import XCTest

@MainActor
final class ScanNowSnapshotsLaunchTests: XCTestCase {
    func testWelcomeScreen() throws {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        snapshot("01WelcomeScreen")
    }
}
