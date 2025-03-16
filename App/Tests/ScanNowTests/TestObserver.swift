import Foundation
import SnapshotTesting
import XCTest

@objc(TestObserver)
final class TestObserver: NSObject, XCTestObservation {
    override init() {
        super.init()
        XCTestObservationCenter.shared.addTestObserver(self)
    }

    deinit {
        XCTestObservationCenter.shared.removeTestObserver(self)
    }

    func testBundleWillStart(_: Bundle) {
        #if RECORD_SNAPSHOT
            isRecording = true
        #endif
    }
}
