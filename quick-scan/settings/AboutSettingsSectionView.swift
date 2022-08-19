import SwiftUI

struct AboutSettingsSectionView: View {
    @ViewBuilder
    var body: some View {
        Section(header: Text("About")) {
            HStack {
                Text("Version")
                Spacer()
                Text("2.2.1")
            }
        }
    }
}

struct AboutSettingsSectionViewPreview: PreviewProvider {
    static var previews: some View {
        Form {
            AboutSettingsSectionView()
        }
    }
}
