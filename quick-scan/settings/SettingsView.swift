import SwiftUI

struct SettingsView: View {
    @ViewBuilder
    var body: some View {
        Form {
            FileSettingsSectionView(settings: AppStorageFileSettings())
            AboutSettingsSectionView()
        }
    }
}

struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
