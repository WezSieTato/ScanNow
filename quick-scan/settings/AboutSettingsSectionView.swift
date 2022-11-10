import SwiftUI

struct AboutSettingsSectionView: View {
    let version: Versioning
    private let strings = Strings.Settings.About.self

    @ViewBuilder
    var body: some View {
        Section(header: Text(strings.title)) {
            HStack {
                Text(strings.version)
                Spacer()
                Text("\(version.versionNumber) (\(version.buildNumber))")
            }
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
