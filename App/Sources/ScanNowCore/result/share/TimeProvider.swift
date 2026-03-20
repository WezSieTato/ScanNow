import Foundation
import Mocking

@Mocked(compilationCondition: .debug)
protocol TimeProvider {
    func now() -> Date
}

final class FoundationTimeProvider: TimeProvider {
    func now() -> Date {
        Date()
    }
}
