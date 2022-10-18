import SwiftUI
import UIKit

final class SettingsViewControllerFactory {
    class func create(userDefaults: UserDefaults = UserDefaults.standard) -> UIViewController {
        let view = SettingsView().defaultAppStorage(userDefaults)
        let viewController = UIHostingController(rootView: view)
        viewController.title = "Settings"
        return viewController
    }
}
