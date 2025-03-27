import Foundation
import VisionKit

protocol DocumentDataExportStrategy {
    func data(from document: VNDocumentCameraScan) -> [Data]
}

enum DocumentDataExportStrategyFactory {
    static func create(fileFormat: ScanFormat) -> DocumentDataExportStrategy {
        switch fileFormat {
        case .pdf:
            return PDFDocumentDataExportStrategy()
        case .jpeg:
            return JPEGDocumentDataExportStrategy()
        case .png:
            return PNGDocumentDataExportStrategy()
        }
    }
}

private final class PDFDocumentDataExportStrategy: DocumentDataExportStrategy {
    func data(from document: VNDocumentCameraScan) -> [Data] {
        [document.pdfDocument.dataRepresentation()]
            .compactMap { $0 }
    }
}

private final class JPEGDocumentDataExportStrategy: DocumentDataExportStrategy {
    func data(from document: VNDocumentCameraScan) -> [Data] {
        (0 ..< document.pageCount)
            .map { document.imageOfPage(at: $0) }
            .compactMap { $0.jpegData(compressionQuality: 1) }
    }
}

private final class PNGDocumentDataExportStrategy: DocumentDataExportStrategy {
    func data(from document: VNDocumentCameraScan) -> [Data] {
        (0 ..< document.pageCount)
            .map { document.imageOfPage(at: $0) }
            .compactMap { $0.pngData() }
    }
}
