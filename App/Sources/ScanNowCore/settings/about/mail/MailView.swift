// Thanks for Gordan Glavaš from SwiftUI Recipes
// https://swiftuirecipes.com/blog/send-mail-in-swiftui

import MessageUI
import SwiftUI
import UIKit

struct ComposeMailData {
    let subject: String
    let recipients: [String]?
    let message: String
    let attachments: [AttachmentData]?
}

struct AttachmentData {
    let data: Data
    let mimeType: String
    let fileName: String
}

typealias MailViewCallback = ((Result<MFMailComposeResult, Error>) -> Void)?

struct MailView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentation
    @State var data: ComposeMailData
    let callback: MailViewCallback

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var presentation: PresentationMode
        @Binding var data: ComposeMailData
        let callback: MailViewCallback

        init(
            presentation: Binding<PresentationMode>,
            data: Binding<ComposeMailData>,
            callback: MailViewCallback
        ) {
            _presentation = presentation
            _data = data
            self.callback = callback
        }

        func mailComposeController(
            _: MFMailComposeViewController,
            didFinishWith result: MFMailComposeResult,
            error: Error?
        ) {
            if let error = error {
                callback?(.failure(error))
            } else {
                callback?(.success(result))
            }
            $presentation.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(presentation: presentation, data: $data, callback: callback)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = context.coordinator
        mailVC.setSubject(data.subject)
        mailVC.setToRecipients(data.recipients)
        mailVC.setMessageBody(data.message, isHTML: false)
        data.attachments?.forEach {
            mailVC.addAttachmentData($0.data, mimeType: $0.mimeType, fileName: $0.fileName)
        }
        mailVC.accessibilityElementDidLoseFocus()
        return mailVC
    }

    func updateUIViewController(
        _: MFMailComposeViewController,
        context _: UIViewControllerRepresentableContext<MailView>
    ) {}

    static var canSendMail: Bool {
        MFMailComposeViewController.canSendMail()
    }
}
