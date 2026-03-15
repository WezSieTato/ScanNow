import SwiftUI

struct AboutSettingsSectionView: View {
    let version: Versioning

    var body: some View {
        Section(header: Text(Strings.Settings.About.title)) {
            WriteToUsView(composeMailDataFactory: ComposeMailDataFactory(appVersioning: version))
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
