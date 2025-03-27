import SwiftUI

struct WelcomeView: View {
    private let strings = Strings.Welcome.self

    let scanAction: () -> Void
    let settingsAction: () -> Void

    @ViewBuilder
    var body: some View {
        VStack {
            Assets.launchIcon.swiftUIImage
            VStack(spacing: 22) {
                Button(strings.scan) { scanAction() }
                Button(strings.settings) { settingsAction() }
            }
            .fixedSize(horizontal: true, vertical: false)
            .buttonStyle(WelcomeButtonStyle())
        }
    }
}

struct WelcomeButtonStyle: ButtonStyle {
    private let cornerRadius: CGFloat = 24
    private let borderWidth: CGFloat = 8

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Assets.welcomeButtonForeground.swiftUIColor)
            .font(.title)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Assets.welcomeButtonBackground.swiftUIColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Assets.welcomeButtonBorder.swiftUIColor, lineWidth: borderWidth)
            )
    }
}

struct WelcomeViewPreview: PreviewProvider {
    static var previews: some View {
        WelcomeView(scanAction: {}, settingsAction: {})
    }
}
