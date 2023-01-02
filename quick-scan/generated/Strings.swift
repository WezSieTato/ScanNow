// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  internal enum Scanner {
    /// Scan
    internal static let title = Strings.tr("Localizable", "scanner.title", fallback: "Scan")
    internal enum NoCamera {
      /// Please allow access to your device's camera to use the document scanner feature.
      internal static let description = Strings.tr("Localizable", "scanner.noCamera.description", fallback: "Please allow access to your device's camera to use the document scanner feature.")
      /// Go to settings
      internal static let settingsButton = Strings.tr("Localizable", "scanner.noCamera.settingsButton", fallback: "Go to settings")
      /// No camera access
      internal static let title = Strings.tr("Localizable", "scanner.noCamera.title", fallback: "No camera access")
    }
    internal enum Share {
      /// _page_%d
      internal static func pageSuffix(_ p1: Int) -> String {
        return Strings.tr("Localizable", "scanner.share.pageSuffix", p1, fallback: "_page_%d")
      }
    }
  }
  internal enum Settings {
    /// Settings
    internal static let title = Strings.tr("Localizable", "settings.title", fallback: "Settings")
    internal enum About {
      /// Write to us
      internal static let email = Strings.tr("Localizable", "settings.about.email", fallback: "Write to us")
      /// About
      internal static let title = Strings.tr("Localizable", "settings.about.title", fallback: "About")
      /// Version
      internal static let version = Strings.tr("Localizable", "settings.about.version", fallback: "Version")
      internal enum EmailCompose {
        /// - app: %@, %@
        /// 
        internal static func app(_ p1: Any, _ p2: Any) -> String {
          return Strings.tr("Localizable", "settings.about.emailCompose.app", String(describing: p1), String(describing: p2), fallback: "- app: %@, %@\n")
        }
        /// 
        /// 
        /// -------App & Device info--------
        /// 
        internal static let appAndDeviceInfo = Strings.tr("Localizable", "settings.about.emailCompose.appAndDeviceInfo", fallback: "\n\n-------App & Device info--------\n")
        /// -------End-------
        internal static let end = Strings.tr("Localizable", "settings.about.emailCompose.end", fallback: "-------End-------")
        /// Feedback for Scan Only
        internal static let subject = Strings.tr("Localizable", "settings.about.emailCompose.subject", fallback: "Feedback for Scan Only")
        /// - system: %@, %@
        /// 
        internal static func system(_ p1: Any, _ p2: Any) -> String {
          return Strings.tr("Localizable", "settings.about.emailCompose.system", String(describing: p1), String(describing: p2), fallback: "- system: %@, %@\n")
        }
      }
    }
    internal enum File {
      /// Scan
      internal static let defaultFilename = Strings.tr("Localizable", "settings.file.defaultFilename", fallback: "Scan")
      /// Example
      internal static let example = Strings.tr("Localizable", "settings.file.example", fallback: "Example")
      /// Filename
      internal static let filename = Strings.tr("Localizable", "settings.file.filename", fallback: "Filename")
      /// Format
      internal static let format = Strings.tr("Localizable", "settings.file.format", fallback: "Format")
      /// File suffix
      internal static let suffix = Strings.tr("Localizable", "settings.file.suffix", fallback: "File suffix")
      /// File
      internal static let title = Strings.tr("Localizable", "settings.file.title", fallback: "File")
      internal enum SuffixCase {
        /// Counter
        internal static let counter = Strings.tr("Localizable", "settings.file.suffixCase.counter", fallback: "Counter")
        /// Date and time
        internal static let dateAndTime = Strings.tr("Localizable", "settings.file.suffixCase.dateAndTime", fallback: "Date and time")
        /// None
        internal static let `none` = Strings.tr("Localizable", "settings.file.suffixCase.none", fallback: "None")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
