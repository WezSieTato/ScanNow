import Foundation

// sourcery: AutoMockable
protocol TimeProvider {
    func now() -> Date
}

final class FoundationTimeProvider: TimeProvider {
    func now() -> Date {
        Date()
    }
}
