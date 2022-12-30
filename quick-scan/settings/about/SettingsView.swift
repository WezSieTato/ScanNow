import SwiftUI

struct SettingsView: View {
    let version: Versioning

    @ViewBuilder
    var body: some View {
        Form {
            FileSettingsSectionView(settings: AppStorageFileSettings())
            AboutSettingsSectionView(version: version)
        }
    }
}

struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        SettingsView(version: PreviewVersion())
    }
}
