import Foundation

protocol FilenameStrategy {
    func filename(settings: any FileSettings) -> String
}

enum FilenameStrategyFactory {
    static func create(fileSuffix: FileSufix) -> FilenameStrategy {
        switch fileSuffix {
        case .none:
            return NoneFilenameStrategy()
        case .counter:
            return CounterFilenameStrategy(counter: AppStorageScanCounter())
        case .dateAndTime:
            return DateAndTimeFilenameStrategy(timeProvider: FoundationTimeProvider())
        }
    }
}

private extension FileSettings {
    var prefix: String {
        !filename.isEmpty ? filename : Strings.Settings.File.defaultFilename
    }
}

final class NoneFilenameStrategy: FilenameStrategy {
    func filename(settings: any FileSettings) -> String {
        settings.prefix
    }
}

final class CounterFilenameStrategy: FilenameStrategy {
    private let counter: ScanCounter

    init(counter: ScanCounter) {
        self.counter = counter
    }

    func filename(settings: any FileSettings) -> String {
        "\(settings.prefix)_\(counter.counter)"
    }
}

// sourcery: AutoMockable
protocol TimeProvider {
    func now() -> Date
}

final class FoundationTimeProvider: TimeProvider {
    func now() -> Date {
        Date()
    }
}

final class DateAndTimeFilenameStrategy: FilenameStrategy {
    private let timeProvider: TimeProvider

    init(timeProvider: TimeProvider) {
        self.timeProvider = timeProvider
    }

    func filename(settings: any FileSettings) -> String {
        let date = timeProvider.now()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy-HH:mm"
        let dateString = dateFormatter.string(from: date)
        return "\(settings.prefix)_\(dateString)"
    }
}
