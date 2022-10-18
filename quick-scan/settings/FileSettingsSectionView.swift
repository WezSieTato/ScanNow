import SwiftUI

struct FileSettingsSectionView<SettingType: FileSettings>: View {
    @StateObject var settings: SettingType

    @ViewBuilder
    var body: some View {
        Section(header: Text("File")) {
            TextField("Filename", text: $settings.filename)

            Picker("Suffix", selection: $settings.selectedSuffix) {
                ForEach(FileSufix.allCases) {
                    Text($0.rawValue.uppercased())
                }
            }

            Picker("Format", selection: $settings.seletedFormat) {
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
