@testable import quick_scan

final class MockFileSettings: FileSettings {
    var filename: String = "Scan"
    var format: ScanFormat = .pdf
    var suffix: FileSufix = .none
}
