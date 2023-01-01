import Foundation
import UIKit

protocol SystemVersioning {
    var systemName: String { get }
    var systemVersion: String { get }
}

extension UIDevice: SystemVersioning {}

final class ComposeMailDataFactory {
    private let appVersioning: Versioning
    private let systemVersioning: SystemVersioning
    private let strings = Strings.Settings.About.EmailCompose.self

    init(
        appVersioning: Versioning = BundledVersion(),
        systemVersioning: SystemVersioning = UIDevice.current
    ) {
        self.appVersioning = appVersioning
        self.systemVersioning = systemVersioning
    }

    func make() -> ComposeMailData {
        ComposeMailData(
            subject: subject,
            recipients: [email],
            message: message,
            attachments: []
        )
    }

    private var subject: String {
        strings.subject
    }

    private var email: String {
        "marcin.stepnowski@gmail.com"
    }

    private var message: String {
        [
            strings.appAndDeviceInfo,
            strings.system(systemVersioning.systemName, systemVersioning.systemVersion),
            strings.app(appVersioning.versionNumber, appVersioning.buildNumber),
            strings.end,
        ].joined()
    }
}
