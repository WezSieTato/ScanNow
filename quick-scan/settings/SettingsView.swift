import SwiftUI

struct SettingsView: View {
    @ViewBuilder
    var body: some View {
        Form {
            FileSettingsSectionView()
            AboutSettingsSectionView()
        }
    }
}

struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
