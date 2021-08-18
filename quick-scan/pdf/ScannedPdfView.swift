import UIKit
import PDFKit

final class ScannedPdfView: UIView {
    
    let pdfView: PDFView = {
        let view = PDFView()
        view.autoScales = true
        return view
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pdfView)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(shareButton)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        let margin = CGFloat(15)
        NSLayoutConstraint.activate([
            pdfView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            pdfView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            pdfView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            pdfView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            shareButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -margin),
            shareButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:
                                                margin),
            shareButton.widthAnchor.constraint(equalToConstant: 38),
            shareButton.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
    
}
