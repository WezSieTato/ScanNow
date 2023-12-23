import UIKit

enum NavigationScannerViewControllerFactory {
    static func make(openScanner: Bool) -> UIViewController {
        let nvc = UINavigationController(rootViewController: WelcomeViewController())
        if openScanner {
            nvc.pushViewController(ScannerViewController(), animated: false)
        }
        return nvc
    }
}
