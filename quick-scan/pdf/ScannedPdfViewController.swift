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

        let shareItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(share))
        
        let settingsItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(settings))
        
        navigationItem.rightBarButtonItems = [shareItem, settingsItem]
    }
    
    @objc
    private func share() {
        if let pdfData = pdfDocument.dataRepresentation() {
            let objectsToShare = [pdfData]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    @objc
    private func settings() {
        
    }
}
