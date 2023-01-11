import PDFKit
import SwiftUI
import UIKit
import VisionKit

final class ScannedDocumentViewController: UIViewController {
    let scannedDocument: VNDocumentCameraScan

    var scannedPdfView: ScannedDocumentView {
        guard let view = view as? ScannedDocumentView else {
            fatalError("View must be a ScannedDocumentView instance")
        }
        return view
    }

    init(scannedDocument: VNDocumentCameraScan) {
        self.scannedDocument = scannedDocument
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = ScannedDocumentView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        scannedPdfView.pdfView.document = scannedDocument.pdfDocument

        let shareItem = UIBarButtonItem(
            image: UIImage(systemName: "square.and.arrow.up"),
            style: .plain,
            target: self,
            action: #selector(share(sender:))
        )

        let settingsItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .plain,
            target: self,
            action: #selector(settings(sender:))
        )

        navigationItem.rightBarButtonItems = [shareItem, settingsItem]
    }

    @objc
    private func share(sender: UIBarButtonItem) {
        let settings: any FileSettings = AppStorageFileSettings()
        let policy = DocumentShareManager()
        let objectsToShare = policy.objectsToShare(from: scannedDocument, fileSettings: settings)
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.barButtonItem = sender

        present(activityVC, animated: true, completion: nil)
    }

    @objc
    private func settings(sender: UIBarButtonItem) {
        let settingsVC = SettingsViewControllerFactory.create()
        settingsVC.popoverPresentationController?.barButtonItem = sender
        present(settingsVC, animated: true, completion: nil)
    }
}
