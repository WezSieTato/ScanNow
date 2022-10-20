import PDFKit
import VisionKit

final class ScannerViewController: UIViewController {
    private let counter: ScanCounter = ScanCounterAppStorage()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Scan"

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
        return UIViewController()
    }

    private func makeChildViewController() -> UIViewController {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            return makeDocumentCameraViewController()
        } else {
            return makeNoCameraAccesViewController()
        }
    }

    private func setupChildViewController() {
        let childVC = makeChildViewController()
        let childView = childVC.view!
        childView.translatesAutoresizingMaskIntoConstraints = false
        childVC.willMove(toParent: self)
        view.addSubview(childView)
        addChild(childVC)
        childVC.didMove(toParent: self)

        NSLayoutConstraint.activate([
            childView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            childView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            childView.topAnchor.constraint(equalTo: view.topAnchor),
            childView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
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
