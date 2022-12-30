import SwiftUI

struct AboutSettingsSectionView: View {
    let version: Versioning

    @ViewBuilder
    var body: some View {
        Section(header: Text(Strings.Settings.About.title)) {
            GithubRowView()
            VersionRowView(version: version)
        }
    }
}

struct AboutSettingsSectionViewPreview: PreviewProvider {
    static var previews: some View {
        Form {
            AboutSettingsSectionView(version: PreviewVersion())
        }
    }
}
