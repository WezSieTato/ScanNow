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

final class FileSettings: ObservableObject {
    @AppStorage("FileSettings.filename")
    var filename: String = "Scan"

    @AppStorage("FileSettings.seletedFormatEnum")
    var seletedFormatEnum: ScanFormat = .pdf

    @AppStorage("FileSettings.selectedSuffix")
    var selectedSuffix: FileSufix = .none
}
