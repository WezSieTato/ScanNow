import SwiftUI

struct AboutSettingsSectionView: View {
    let version: Versioning
    private let strings = Strings.Settings.About.self
    @Environment(\.openURL) var openURL

    @ViewBuilder
    var body: some View {
        Section(header: Text(strings.title)) {
            githubRow
            versionRow
        }
    }

    @ViewBuilder
    private var versionRow: some View {
        HStack {
            Text(strings.version)
            Spacer()
            Text("\(version.versionNumber) (\(version.buildNumber))")
        }
    }

    @ViewBuilder var githubRow: some View {
        HStack {
            Assets.githubMark.swiftUIImage
            Spacer()
            Text("WezSieTato/ScanNow")
        }
        .onTapGesture {
            openURL(URL(string: "https://github.com/WezSieTato/ScanNow")!)
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
