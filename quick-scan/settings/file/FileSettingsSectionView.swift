import SwiftUI

struct FileSettingsSectionView<SettingType: FileSettings>: View {
    @StateObject var settings: SettingType

    private let strings = Strings.Settings.File.self

    @ViewBuilder
    var body: some View {
        Section(header: Text(strings.title)) {
            TextField(strings.filename, text: $settings.filename)

            Picker(strings.suffix, selection: $settings.suffix) {
                ForEach(FileSufix.allCases) {
                    Text($0.title)
                }
            }

            Picker(strings.format, selection: $settings.format) {
                ForEach(ScanFormat.allCases) {
                    Text($0.rawValue.uppercased())
                }
            }

            HStack {
                Text(strings.example)
                Spacer()
                Text(FilenameStrategyFactory.create(fileSuffix: settings.suffix).filename(settings: settings))
            }
        }
    }
}

private extension FileSufix {
    var title: String {
        let strings = Strings.Settings.File.SuffixCase.self
        switch self {
        case .none:
            return strings.none
        case .counter:
            return strings.counter
        case .dateAndTime:
            return strings.dateAndTime
        }
    }
}

struct FileSettingsSectionViewPreview: PreviewProvider {
    static var previews: some View {
        Form {
            FileSettingsSectionView(settings: AppStorageFileSettings())
        }
    }
}
