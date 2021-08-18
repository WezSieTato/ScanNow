import UIKit
import PDFKit

final class ScannedPdfView: UIView {
    
    let pdfView: PDFView = {
        let view = PDFView()
        view.autoScales = true
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pdfView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            pdfView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            pdfView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            pdfView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            pdfView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
