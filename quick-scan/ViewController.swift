import UIKit
import VisionKit
import PDFKit

class ViewController: UIViewController, VNDocumentCameraViewControllerDelegate {
    
    @IBOutlet weak var btnScan: UIButton!
    @IBOutlet weak var btnPdf: UIButton!
    @IBOutlet weak var btnShare: UIButton!

    var pdfView : PDFView!
    var pdfDocument: PDFDocument!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnPdf.isHidden = true
        btnShare.isHidden = true
        addPDFView()
    }
    
    func addPDFView()
    {
        pdfView = PDFView()

        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)

        pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: btnScan.bottomAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: btnShare.topAnchor).isActive = true
    }

    @IBAction func btnViewPDF(_ sender: Any) {
            pdfView.document = pdfDocument
    }
    
    @IBAction func btnScanDocument(_ sender: Any) {

        let scannerViewController = VNDocumentCameraViewController()
        scannerViewController.delegate = self
        present(scannerViewController, animated: true)
    }
    
    @IBAction func btnShareDocument(_ sender: Any) {
        if let pdfData = pdfDocument.dataRepresentation() {
            let objectsToShare = [pdfData]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.btnShare

            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            return
        }
        
        DispatchQueue.main.async { [weak self] in

            guard let self = self else {
                return
            }
            
            self.pdfDocument = PDFDocument()

            for i in 0 ..< scan.pageCount {
                 let image = scan.imageOfPage(at: i)
                    print("image size is \(image.size.width), \(image.size.height)")
                    let pdfPage = PDFPage(image: image)
                self.pdfDocument.insert(pdfPage!, at: i)
            }
        
        }
        controller.dismiss(animated: true)
        btnPdf.isHidden = false
        btnShare.isHidden = false
        
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        print(error)
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
    
}

extension UIImage{
    func resize(toWidth width: CGFloat) -> UIImage? {
        let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        return UIGraphicsImageRenderer(size: canvas, format: imageRendererFormat).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
}

