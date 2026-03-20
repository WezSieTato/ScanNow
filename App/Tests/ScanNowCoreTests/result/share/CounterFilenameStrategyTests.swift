import Mocking
@testable import ScanNowCore
import Testing

struct CounterFilenameStrategyTests {
    private let sut: CounterFilenameStrategy
    private let counter: ScanCounterMock
    private let fileSettings: FileSettingsMock

    init() {
        counter = ScanCounterMock()
        counter._counter.getter.implementation = .returns(0)
        sut = CounterFilenameStrategy(counter: counter)
        fileSettings = FileSettingsMock()
    }

    @Test func filename_whenSettingsFilenameIsExample_andCounter0() {
        fileSettings._filename.getter.implementation = .returns("Example")

        #expect(sut.filename(settings: fileSettings) == "Example_0")
    }

    @Test func filename_whenSettingsFilenameIsExample_andCounter1() {
        fileSettings._filename.getter.implementation = .returns("Example")
        counter._counter.getter.implementation = .returns(1)

        #expect(sut.filename(settings: fileSettings) == "Example_1")
    }

    @Test func filename_whenSettingsFilenameIsScan_andCounter0() {
        fileSettings._filename.getter.implementation = .returns("Scan")

        #expect(sut.filename(settings: fileSettings) == "Scan_0")
    }

    @Test func filename_whenSettingsFilenameIsEmptyString_andCounter0() {
        fileSettings._filename.getter.implementation = .returns("")

        #expect(sut.filename(settings: fileSettings) == "Scan_0")
    }
}
