import SwiftUI
import UIKit

final class SettingsViewControllerFactory {
    class func create(
        userDefaults: UserDefaults = UserDefaults.standard,
        version: Versioning = BundledVersion()
    ) -> UIViewController {
        let view = SettingsView(version: version).defaultAppStorage(userDefaults)
        let viewController = UIHostingController(rootView: view)
        viewController.title = "Settings"
        return viewController
    }
}
