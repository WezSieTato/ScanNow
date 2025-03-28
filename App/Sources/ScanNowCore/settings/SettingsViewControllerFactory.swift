import SwiftUI
import UIKit

final class SettingsViewControllerFactory {
    static func create(
        userDefaults: UserDefaults = UserDefaults.standard,
        version: Versioning = BundledVersion(),
        timeProvider: TimeProvider = FoundationTimeProvider()
    ) -> UIViewController {
        let view = SettingsView(version: version, timeProvider: timeProvider).defaultAppStorage(userDefaults)
        let viewController = UIHostingController(rootView: view)
        viewController.title = Strings.Settings.title
        return viewController
    }
}
