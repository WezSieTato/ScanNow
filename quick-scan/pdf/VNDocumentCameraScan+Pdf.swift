import VisionKit
import PDFKit

extension VNDocumentCameraScan {
    var pdfDocument: PDFDocument {
        let pdfDocument = PDFDocument()
        for i in 0 ..< pageCount {
             let image = imageOfPage(at: i)
            let pdfPage = PDFPage(image: image)
            pdfDocument.insert(pdfPage!, at: i)
        }
        return pdfDocument
    }
}
