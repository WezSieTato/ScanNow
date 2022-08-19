import PDFKit
import VisionKit

extension VNDocumentCameraScan {
    var pdfDocument: PDFDocument {
        let pdfDocument = PDFDocument()
        for pageIndex in 0 ..< pageCount {
            let image = imageOfPage(at: pageIndex)
            let pdfPage = PDFPage(image: image)
            pdfDocument.insert(pdfPage!, at: pageIndex)
        }
        return pdfDocument
    }
}
