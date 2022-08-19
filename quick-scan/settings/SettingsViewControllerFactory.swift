import SwiftUI
import UIKit

final class SettingsViewControllerFactory {
    class func create() -> UIViewController {
        let view = SettingsView()
        let viewController = UIHostingController(rootView: view)
        viewController.title = "Settings"
        return viewController
    }
}
