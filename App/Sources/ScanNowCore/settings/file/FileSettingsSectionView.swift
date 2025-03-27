import SwiftUI

struct FileSettingsSectionView<SettingType: FileSettings>: View {
    @StateObject var settings: SettingType
    let timeProvider: TimeProvider

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
                Text(settings.exampleFileName(timeProvider: timeProvider))
            }
        }
    }
}

private extension FileSettings {
    func exampleFileName(timeProvider: TimeProvider) -> String {
        FilenameStrategyFactory
            .create(fileSuffix: suffix, timeProvider: timeProvider)
            .filename(settings: self) + "." + format.rawValue.lowercased()
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
            FileSettingsSectionView(settings: AppStorageFileSettings(), timeProvider: FoundationTimeProvider())
        }
    }
}
