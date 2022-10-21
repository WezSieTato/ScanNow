@testable import quick_scan

final class MockFileSettings: FileSettings {
    var filename: String = "Scan"
    var seletedFormat: ScanFormat = .pdf
    var selectedSuffix: FileSufix = .none
}
