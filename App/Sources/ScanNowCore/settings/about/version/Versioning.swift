import Foundation

// sourcery: AutoMockable
protocol Versioning {
    var versionNumber: String { get }
    var buildNumber: String { get }
}

final class BundledVersion: Versioning {
    var versionNumber: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }

    var buildNumber: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
}

struct PreviewVersion: Versioning {
    var versionNumber: String = "2.1.3"
    var buildNumber: String = "7"
}
