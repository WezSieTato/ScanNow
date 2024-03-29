import AVKit
import PDFKit
import StoreKit
import SwiftUI
import VisionKit

final class ScannerViewController: UIViewController {
    private let counter: ScanCounter = AppStorageScanCounter()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Strings.Scanner.title

        let documentCameraViewController = VNDocumentCameraViewController()
        documentCameraViewController.delegate = self
        addChildViewControllerOnFullView(documentCameraViewController)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension ScannerViewController: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewController(
        _ controller: VNDocumentCameraViewController,
        didFinishWith scan: VNDocumentCameraScan
    ) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            return
        }

        counter.increaseCounter()

        DispatchQueue.main.async { [weak self] in

            guard let self = self else {
                return
            }

            let pdfVC = ScannedDocumentViewController(scannedDocument: scan)
            self.navigationController?.pushViewController(pdfVC, animated: true)
            self.requestReviewIfNeeded()
        }
    }

    private func requestReviewIfNeeded() {
        guard let windowScene = view.window?.windowScene,
              counter.counter >= 3 else {
            return
        }
        SKStoreReviewController.requestReview(in: windowScene)
    }

    func documentCameraViewControllerDidCancel(_: VNDocumentCameraViewController) {
        navigationController?.popViewController(animated: true)
    }

    func documentCameraViewController(_: VNDocumentCameraViewController, didFailWithError _: Error) {
        navigationController?.popViewController(animated: true)
    }
}
