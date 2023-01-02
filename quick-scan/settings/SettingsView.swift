import SwiftUI

struct SettingsView: View {
    let version: Versioning
    let timeProvider: TimeProvider

    @ViewBuilder
    var body: some View {
        Form {
            FileSettingsSectionView(settings: AppStorageFileSettings(), timeProvider: timeProvider)
            AboutSettingsSectionView(version: version)
        }
    }
}

struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        SettingsView(version: PreviewVersion(), timeProvider: FoundationTimeProvider())
    }
}
