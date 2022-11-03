import Foundation

protocol Versioning {
    var versionNumber: String { get }
    var buildNumber: String { get }
}

final class BundledVersion: Versioning {
    let bundle: Bundle = .main

    var versionNumber: String {
        guard let number = bundle.infoDictionary?["CFBundleShortVersionString"] as? String else {
            fatalError("Marketing version needs to be set in Info.plist")
        }
        return number
    }

    var buildNumber: String {
        guard let number = bundle.infoDictionary?["CFBundleVersion"] as? String else {
            fatalError("Build number needs to be set in Info.plist")
        }
        return number
    }
}

struct PreviewVersion: Versioning {
    var versionNumber: String = "2.1.3"
    var buildNumber: String = "7"
}
