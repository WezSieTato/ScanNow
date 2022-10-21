import Foundation
@testable import quick_scan

final class MockScanCounter: ScanCounter {
    var counter: Int = 0

    func increaseCounter() {}
}
