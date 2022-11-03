import SwiftUI

struct AboutSettingsSectionView: View {
    let version: Versioning

    @ViewBuilder
    var body: some View {
        Section(header: Text("About")) {
            HStack {
                Text("Version")
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
