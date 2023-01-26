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
        navigationController?.pushViewController(ScannerViewController(), animated: true)
    }
}
