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
      /// About
      internal static let title = Strings.tr("Localizable", "settings.about.title", fallback: "About")
      /// Version
      internal static let version = Strings.tr("Localizable", "settings.about.version", fallback: "Version")
    }
    internal enum File {
      /// Scan
      internal static let defaultFilename = Strings.tr("Localizable", "settings.file.defaultFilename", fallback: "Scan")
      /// Filename
      internal static let filename = Strings.tr("Localizable", "settings.file.filename", fallback: "Filename")
      /// Format
      internal static let format = Strings.tr("Localizable", "settings.file.format", fallback: "Format")
      /// Suffix
      internal static let suffix = Strings.tr("Localizable", "settings.file.suffix", fallback: "Suffix")
      /// File
      internal static let title = Strings.tr("Localizable", "settings.file.title", fallback: "File")
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
