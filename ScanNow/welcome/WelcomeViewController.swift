import AVFoundation
import SwiftUI
import UIKit

final class WelcomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let welcomeView = WelcomeView(scanAction: { [weak self] in
            self?.openScanner()
        }, settingsAction: { [weak self] in
            self?.openSettings()
        })
        let hostingVC = UIHostingController(rootView: welcomeView)
        addChildViewControllerOnFullView(hostingVC)
    }

    private func openSettings() {
        navigationController?.pushViewController(SettingsViewControllerFactory.create(), animated: true)
    }

    private func openScanner() {
        if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            navigationController?.pushViewController(ScannerViewController(), animated: true)
        } else {
            let strings = Strings.Welcome.NoCamera.self
            let alertVC = UIAlertController(
                title: strings.title,
                message: strings.description,
                preferredStyle: .alert
            )
            alertVC.addAction(UIAlertAction(
                title: strings.settings,
                style: .default,
                handler: { _ in
                    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                        return
                    }
                    UIApplication.shared.open(settingsUrl)
                }
            ))
            alertVC.addAction(UIAlertAction(title: strings.cancel, style: .destructive))
            present(alertVC, animated: true, completion: nil)
        }
    }
}
