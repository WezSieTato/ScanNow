import SwiftUI

struct WriteToUsView: View {
    @State private var showMailView = false

    @State private var mailData = ComposeMailDataFactory().make()

    @ViewBuilder var body: some View {
        HStack {
            Text(Strings.Settings.About.email)
            Spacer()
            Image(systemName: "envelope")
        }
        .disabled(!MailView.canSendMail)
        .onTapGesture {
            showMailView = true
        }
        .sheet(isPresented: $showMailView) {
            MailView(data: $mailData) { _ in
                showMailView = true
            }
        }
    }
}

struct WriteToUsViewPreview: PreviewProvider {
    static var previews: some View {
        Form {
            WriteToUsView()
        }
    }
}
