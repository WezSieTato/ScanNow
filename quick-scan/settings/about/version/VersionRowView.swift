import SwiftUI

struct VersionRowView: View {
    let version: Versioning

    @ViewBuilder
    var body: some View {
        HStack {
            Text(Strings.Settings.About.version)
            Spacer()
            Text("\(version.versionNumber) (\(version.buildNumber))")
        }
    }
}

struct VersionRowViewPreview: PreviewProvider {
    static var previews: some View {
        Form {
            VersionRowView(version: PreviewVersion())
        }
    }
}
