import UIKit
import PDFKit

final class ScannedPdfViewController: UIViewController {
    let pdfDocument: PDFDocument
    
    var scannedPdfView: ScannedPdfView {
        view as! ScannedPdfView
    }

    init(pdfDocument: PDFDocument) {
        self.pdfDocument = pdfDocument
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = ScannedPdfView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scannedPdfView.pdfView.document = pdfDocument
        scannedPdfView.shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
    }
    
    @objc
    private func share() {
        if let pdfData = pdfDocument.dataRepresentation() {
            let objectsToShare = [pdfData]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = scannedPdfView.shareButton

            self.present(activityVC, animated: true, completion: nil)
        }

    }
}
