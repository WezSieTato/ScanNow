import SwiftUI

enum ScanFormat: String, CaseIterable, Identifiable {
    case pdf
    case jpeg
    case png
    case heic

    var id: Self { self }
}

enum FileSufix: String, CaseIterable, Identifiable {
    case none
    case counter
    case dateAndTime

    var id: Self { self }
}

protocol FileSettings: ObservableObject {
    var filename: String { get set }
    var seletedFormatEnum: ScanFormat { get set }
    var selectedSuffix: FileSufix { get set }
}

final class AppStorageFileSettings: FileSettings {
    @AppStorage("FileSettings.filename")
    var filename: String = "Scan"

    @AppStorage("FileSettings.seletedFormatEnum")
    var seletedFormatEnum: ScanFormat = .pdf

    @AppStorage("FileSettings.selectedSuffix")
    var selectedSuffix: FileSufix = .none
}
