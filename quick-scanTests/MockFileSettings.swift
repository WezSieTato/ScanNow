@testable import quick_scan

final class MockFileSettings: FileSettings {
    var filename: String = "Scan"
    var seletedFormatEnum: ScanFormat = .pdf
    var selectedSuffix: FileSufix = .none
}
