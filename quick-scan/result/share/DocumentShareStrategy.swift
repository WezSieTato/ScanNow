import Foundation
import VisionKit

protocol DocumentShareStrategy {
    func objectsToShare(from document: VNDocumentCameraScan, fileSettings: any FileSettings) -> [Any]
}

final class DocumentShareManager: DocumentShareStrategy {
    func objectsToShare(from document: VNDocumentCameraScan, fileSettings: any FileSettings) -> [Any] {
        let exporter = DocumentDataExportStrategyFactory.create(fileFormat: fileSettings.seletedFormat)
        let data = exporter.data(from: document)
        let nameCreator = FilenameStrategyFactory.create(fileSuffix: fileSettings.selectedSuffix)
        let basename = nameCreator.filename(prefix: fileSettings.filename)
        return addName(to: data, basename: basename, fileFormat: fileSettings.seletedFormat.rawValue)
    }

    private func addName(to data: [Data], basename: String, fileFormat: String) -> [Any] {
        let totalNumber = data.count
        return data
            .enumerated()
            .map { index, element in
                let filename = basename + partSuffix(index: index, totalNumber: totalNumber) + "." + fileFormat
                let url = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
                    .appendingPathComponent(filename)
                try? element.write(to: url)
                return url
            }
    }

    private func partSuffix(index: Int, totalNumber: Int) -> String {
        if totalNumber > 1 {
            return "_part_\(index)"
        } else {
            return ""
        }
    }
}
