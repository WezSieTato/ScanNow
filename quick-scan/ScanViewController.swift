import Foundation
import VisionKit
import PDFKit

final class ScanViewController: UIViewController {
        
    fileprivate func setupNewDocumentCameraViewController() {
        let documentCameraViewController = VNDocumentCameraViewController()
        documentCameraViewController.view.translatesAutoresizingMaskIntoConstraints = false
        documentCameraViewController.willMove(toParent: self)
        view.addSubview(documentCameraViewController.view)
        addChild(documentCameraViewController)
        documentCameraViewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            documentCameraViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            documentCameraViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            documentCameraViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            documentCameraViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        documentCameraViewController.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Scan"
        
        setupNewDocumentCameraViewController()
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

extension ScanViewController: VNDocumentCameraViewControllerDelegate {
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            return
        }
        
        DispatchQueue.main.async { [weak self] in

            guard let self = self else {
                return
            }
            
            let pdfDocument = PDFDocument()

            for i in 0 ..< scan.pageCount {
                 let image = scan.imageOfPage(at: i)
                    print("image size is \(image.size.width), \(image.size.height)")
                    let pdfPage = PDFPage(image: image)
                pdfDocument.insert(pdfPage!, at: i)
            }
        
            let pdfVC = ScannedPdfViewController(pdfDocument: pdfDocument)
            self.navigationController?.pushViewController(pdfVC, animated: true)
        }
        
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
        
        setupNewDocumentCameraViewController()
    }

}
