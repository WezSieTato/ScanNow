import Foundation

protocol Versioning {
    var versionNumber: String { get }
    var buildNumber: String { get }
}

final class BundledVersion: Versioning {
    var versionNumber: String {
        return InfoPlist.cfBundleShortVersionString
    }

    var buildNumber: String {
        return InfoPlist.cfBundleVersion
    }
}

struct PreviewVersion: Versioning {
    var versionNumber: String = "2.1.3"
    var buildNumber: String = "7"
}
