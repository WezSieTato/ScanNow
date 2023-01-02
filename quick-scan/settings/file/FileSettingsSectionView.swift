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
                    Text($0.rawValue.uppercased())
                }
            }

            Picker(strings.format, selection: $settings.format) {
                ForEach(ScanFormat.allCases) {
                    Text($0.rawValue.uppercased())
                }
            }
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
