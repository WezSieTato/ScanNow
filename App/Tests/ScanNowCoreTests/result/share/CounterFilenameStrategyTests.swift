@testable import ScanNowCore
import Testing

@Suite struct CounterFilenameStrategyTests {
    private let sut: CounterFilenameStrategy
    private let counter: ScanCounterMock
    private let fileSettings: FileSettingsMock

    init() {
        counter = ScanCounterMock()
        counter.counter = 0
        sut = CounterFilenameStrategy(counter: counter)
        fileSettings = FileSettingsMock()
    }

    @Test func filename_whenSettingsFilenameIsExample_andCounter0() {
        fileSettings.filename = "Example"

        #expect(sut.filename(settings: fileSettings) == "Example_0")
    }

    @Test func filename_whenSettingsFilenameIsExample_andCounter1() {
        fileSettings.filename = "Example"
        counter.counter = 1

        #expect(sut.filename(settings: fileSettings) == "Example_1")
    }

    @Test func filename_whenSettingsFilenameIsScan_andCounter0() {
        fileSettings.filename = "Scan"

        #expect(sut.filename(settings: fileSettings) == "Scan_0")
    }

    @Test func filename_whenSettingsFilenameIsEmptyString_andCounter0() {
        fileSettings.filename = ""

        #expect(sut.filename(settings: fileSettings) == "Scan_0")
    }
}
