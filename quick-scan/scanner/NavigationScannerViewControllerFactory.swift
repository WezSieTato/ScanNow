import UIKit

final class NavigationScannerViewControllerFactory {
    static func make() -> UIViewController {
        let scannerVC = ScannerViewController()
        let nvc = UINavigationController(rootViewController: scannerVC)
        return scannerVC
    }
}
