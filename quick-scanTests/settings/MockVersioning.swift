@testable import quick_scan

struct MockVersioning: Versioning {
    var versionNumber: String
    var buildNumber: String
}
