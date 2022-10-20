import Foundation

protocol FilenameStrategy {
    func filename(prefix: String) -> String
}

enum FilenameStrategyFactory {
    static func create(fileSuffix: FileSufix) -> FilenameStrategy {
        switch fileSuffix {
        case .none:
            return NoneFilenameStrategy()
        case .counter:
            return CounterFilenameStrategy(counter: ScanCounterAppStorage())
        case .dateAndTime:
            return DateAndTimeFilenameStrategy(timeProvider: FoundationTimeProvider())
        }
    }
}

private final class NoneFilenameStrategy: FilenameStrategy {
    func filename(prefix: String) -> String {
        prefix
    }
}

private final class CounterFilenameStrategy: FilenameStrategy {
    private let counter: ScanCounter

    init(counter: ScanCounter) {
        self.counter = counter
    }

    func filename(prefix: String) -> String {
        "\(prefix)_\(counter.counter)"
    }
}

protocol TimeProvider {
    func now() -> Date
}

final class FoundationTimeProvider: TimeProvider {
    func now() -> Date {
        Date()
    }
}

private final class DateAndTimeFilenameStrategy: FilenameStrategy {
    private let timeProvider: TimeProvider

    init(timeProvider: TimeProvider) {
        self.timeProvider = timeProvider
    }

    func filename(prefix: String) -> String {
        let date = timeProvider.now()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy-HH:mm"
        let dateString = dateFormatter.string(from: date)
        return "\(prefix)_\(dateString)"
    }
}
