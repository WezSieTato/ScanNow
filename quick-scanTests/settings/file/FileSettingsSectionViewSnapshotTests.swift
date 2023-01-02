@testable import quick_scan
import SnapshotTesting
import SwiftUI
import XCTest

final class FileSettingsSectionViewSnapshotTests: XCTestCase {
    private var sut: Form<FileSettingsSectionView<FileSettingsMock>>!
    private var fileSettings: FileSettingsMock!

    override func setUp() {
        super.setUp()

        fileSettings = FileSettingsMock()
        fileSettings.filename = "Scan"
        fileSettings.format = .pdf
        fileSettings.suffix = .none

        sut = Form { [fileSettings] in
            FileSettingsSectionView(settings: fileSettings!)
        }
    }

    func testView_whenSettingsAreDefault() {
        testView()
    }

    func testView_whenFileNameIsEmpty() {
        fileSettings.filename = ""
        testView()
    }

    func testView_whenSuffixIsCounter() {
        fileSettings.suffix = .counter
        testView()
    }

    func testView_whenSuffixIsDateAndTime() {
        fileSettings.suffix = .dateAndTime
        testView()
    }

    func testView_whenFormatIsJpeg() {
        fileSettings.format = .jpeg
        testView()
    }

    private func testView(file: StaticString = #file, testName: String = #function, line: UInt = #line) {
        assertSnapshot(
            matching: sut,
            as: .image(layout: .fixed(width: 375, height: 220)),
            record: false,
            file: file,
            testName: testName,
            line: line
        )
    }
}
