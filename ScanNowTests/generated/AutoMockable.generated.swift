// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif


@testable import ScanNow














class FileSettingsMock: FileSettings {
    var filename: String {
        get { return underlyingFilename }
        set(value) { underlyingFilename = value }
    }
    var underlyingFilename: String!
    var format: ScanFormat {
        get { return underlyingFormat }
        set(value) { underlyingFormat = value }
    }
    var underlyingFormat: ScanFormat!
    var suffix: FileSufix {
        get { return underlyingSuffix }
        set(value) { underlyingSuffix = value }
    }
    var underlyingSuffix: FileSufix!

}
class ScanCounterMock: ScanCounter {
    var counter: Int {
        get { return underlyingCounter }
        set(value) { underlyingCounter = value }
    }
    var underlyingCounter: Int!

    //MARK: - increaseCounter

    var increaseCounterCallsCount = 0
    var increaseCounterCalled: Bool {
        return increaseCounterCallsCount > 0
    }
    var increaseCounterClosure: (() -> Void)?

    func increaseCounter() {
        increaseCounterCallsCount += 1
        increaseCounterClosure?()
    }

}
class SystemVersioningMock: SystemVersioning {
    var systemName: String {
        get { return underlyingSystemName }
        set(value) { underlyingSystemName = value }
    }
    var underlyingSystemName: String!
    var systemVersion: String {
        get { return underlyingSystemVersion }
        set(value) { underlyingSystemVersion = value }
    }
    var underlyingSystemVersion: String!

}
class TimeProviderMock: TimeProvider {

    //MARK: - now

    var nowCallsCount = 0
    var nowCalled: Bool {
        return nowCallsCount > 0
    }
    var nowReturnValue: Date!
    var nowClosure: (() -> Date)?

    func now() -> Date {
        nowCallsCount += 1
        return nowClosure.map({ $0() }) ?? nowReturnValue
    }

}
class VersioningMock: Versioning {
    var versionNumber: String {
        get { return underlyingVersionNumber }
        set(value) { underlyingVersionNumber = value }
    }
    var underlyingVersionNumber: String!
    var buildNumber: String {
        get { return underlyingBuildNumber }
        set(value) { underlyingBuildNumber = value }
    }
    var underlyingBuildNumber: String!

}
