import AVKit
import PDFKit
import SwiftUI
import VisionKit

final class ScannerViewController: UIViewController {
    private let counter: ScanCounter = AppStorageScanCounter()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Strings.Scanner.title

        setupChildViewController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: Child view configuration

    private func makeDocumentCameraViewController() -> UIViewController {
        let documentCameraViewController = VNDocumentCameraViewController()
        documentCameraViewController.delegate = self
        return documentCameraViewController
    }

    private func makeNoCameraAccesViewController() -> UIViewController {
        return UIHostingController(rootView: NoCameraAccessView())
    }

    private func makeChildViewController() -> UIViewController {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return makeDocumentCameraViewController()

        case .notDetermined, .denied, .restricted:
            fallthrough

        @unknown default:
            return makeNoCameraAccesViewController()
        }
    }

    private func setupChildViewController() {
        let childVC = makeChildViewController()
        addChildViewControllerOnFullView(childVC)
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
        }
    }

    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()

        setupChildViewController()
    }
}
