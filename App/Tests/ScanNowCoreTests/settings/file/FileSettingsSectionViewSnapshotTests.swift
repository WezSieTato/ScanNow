import Mocking
@testable import ScanNowCore
import SnapshotTesting
import SwiftUI
import Testing

@Suite(.snapshots(record: .missing))
@MainActor
struct FileSettingsSectionViewSnapshotTests {
    private let sut: Form<FileSettingsSectionView<FileSettingsMock>>
    private let fileSettings: FileSettingsMock

    init() {
        fileSettings = FileSettingsMock()
        fileSettings._filename.getter.implementation = .returns("Scan")
        fileSettings._format.getter.implementation = .returns(.pdf)
        fileSettings._suffix.getter.implementation = .returns(.none)

        let timeProvider = TimeProviderMock()
        timeProvider._now.implementation = .returns(Date.date())

        sut = Form { [fileSettings] in
            FileSettingsSectionView(settings: fileSettings, timeProvider: timeProvider)
        }
    }

    @Test func view_whenSettingsAreDefault() {
        assertSnapshot(
            of: sut,
            as: .image(layout: .fixed(width: 375, height: 240))
        )
    }

    @Test func view_whenFileNameIsEmpty() {
        fileSettings._filename.getter.implementation = .returns("")
        assertSnapshot(
            of: sut,
            as: .image(layout: .fixed(width: 375, height: 240))
        )
    }

    @Test func view_whenSuffixIsCounter() {
        fileSettings._suffix.getter.implementation = .returns(.counter)
        assertSnapshot(
            of: sut,
            as: .image(layout: .fixed(width: 375, height: 240))
        )
    }

    @Test func view_whenSuffixIsDateAndTime() {
        fileSettings._suffix.getter.implementation = .returns(.dateAndTime)
        assertSnapshot(
            of: sut,
            as: .image(layout: .fixed(width: 375, height: 240))
        )
    }

    @Test func view_whenFormatIsJpeg() {
        fileSettings._format.getter.implementation = .returns(.jpeg)
        assertSnapshot(
            of: sut,
            as: .image(layout: .fixed(width: 375, height: 240))
        )
    }
}
