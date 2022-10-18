@testable import quick_scan
import SnapshotTesting
import SwiftUI
import XCTest

final class FileSettingsSectionViewSnapshotTests: XCTestCase {
    private var sut: Form<FileSettingsSectionView<MockFileSettings>>!
    private var fileSettings: MockFileSettings!

    override func setUp() {
        super.setUp()

        fileSettings = MockFileSettings()
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
        fileSettings.selectedSuffix = .counter
        testView()
    }

    func testView_whenFormatIsJpeg() {
        fileSettings.seletedFormat = .jpeg
        testView()
    }
    
    private func testView(file: StaticString = #file, testName: String = #function, line: UInt = #line) {
        assertSnapshot(matching: sut,
                       as: .image(layout: .fixed(width: 375, height: 220)),
                       record: false,
                       file: file,
                       testName: testName,
                       line: line)
    }
}
