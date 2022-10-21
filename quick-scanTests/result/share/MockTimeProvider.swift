import Foundation
@testable import quick_scan

final class MockTimeProvider: TimeProvider {
    var date: Date

    init(date: Date) {
        self.date = date
    }

    func now() -> Date {
        date
    }
}
