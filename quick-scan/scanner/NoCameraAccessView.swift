import SwiftUI

struct NoCameraAccessView: View {
    private let strings = Strings.Scanner.NoCamera.self

    @ViewBuilder
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "camera.viewfinder")
                .font(.system(size: 70))
            Text(strings.title)
                .font(.largeTitle)
            Text(strings.description).frame(alignment: .center)
            Button(action: {
                UIApplication.shared.open(URL(string: "App-prefs:Camera")!)

            }, label: {
                Text(strings.settingsButton).multilineTextAlignment(.center)
            })
        }.padding([.horizontal], 50)
    }
}

struct NoCameraAccessViewPreview: PreviewProvider {
    static var previews: some View {
        NoCameraAccessView()
    }
}
