@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import Testing

@Suite @MainActor struct FileSettingsSectionViewSnapshotTests {
    private let sut: Form<FileSettingsSectionView<FileSettingsMock>>
    private let fileSettings: FileSettingsMock

    init() {
        fileSettings = FileSettingsMock()
        fileSettings.filename = "Scan"
        fileSettings.format = .pdf
        fileSettings.suffix = .none

        let timeProvider = TimeProviderMock()
        timeProvider.nowReturnValue = Date.date()

        sut = Form { [fileSettings] in
            FileSettingsSectionView(settings: fileSettings, timeProvider: timeProvider)
        }
    }

    @Test func testView_whenSettingsAreDefault() {
        assertSnapshot(
            of: sut,
            as: .image(layout: .fixed(width: 375, height: 240)),
            record: false
        )
    }

    @Test func testView_whenFileNameIsEmpty() {
        fileSettings.filename = ""
        assertSnapshot(
            of: sut,
            as: .image(layout: .fixed(width: 375, height: 240)),
            record: false
        )
    }

    @Test func testView_whenSuffixIsCounter() {
        fileSettings.suffix = .counter
        assertSnapshot(
            of: sut,
            as: .image(layout: .fixed(width: 375, height: 240)),
            record: false
        )
    }

    @Test func testView_whenSuffixIsDateAndTime() {
        fileSettings.suffix = .dateAndTime
        assertSnapshot(
            of: sut,
            as: .image(layout: .fixed(width: 375, height: 240)),
            record: false
        )
    }

    @Test func testView_whenFormatIsJpeg() {
        fileSettings.format = .jpeg
        assertSnapshot(
            of: sut,
            as: .image(layout: .fixed(width: 375, height: 240)),
            record: false
        )
    }
}
