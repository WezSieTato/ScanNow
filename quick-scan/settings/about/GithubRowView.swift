import SwiftUI

struct GithubRowView: View {
    @Environment(\.openURL) var openURL

    private let repositoryName = "WezSieTato/ScanNow"

    @ViewBuilder var body: some View {
        HStack {
            Assets.githubMark.swiftUIImage
            Spacer()
            Text(repositoryName)
        }
        .onTapGesture {
            guard let url = URL(string: "https://github.com/\(repositoryName)") else {
                return
            }
            openURL(url)
        }
    }
}

struct GithubRowViewPreview: PreviewProvider {
    static var previews: some View {
        Form {
            GithubRowView()
        }
    }
}
