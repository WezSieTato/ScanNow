import SwiftUI

enum ScanFormat: String, CaseIterable, Identifiable {
    case pdf
    case jpeg
    case png

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
    var format: ScanFormat { get set }
    var suffix: FileSufix { get set }
}

final class AppStorageFileSettings: FileSettings {
    @AppStorage("FileSettings.filename")
    var filename: String = Strings.Settings.File.defaultFilename

    @AppStorage("FileSettings.seletedFormat")
    var format: ScanFormat = .pdf

    @AppStorage("FileSettings.selectedSuffix")
    var suffix: FileSufix = .none
}
