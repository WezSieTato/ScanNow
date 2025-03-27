import AVKit
import UIKit

public final class AskForCameraViewController: UIViewController {
    private let launchScreenVC: UIViewController

    public init(launchScreenVC: UIViewController) {
        self.launchScreenVC = launchScreenVC
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllerOnFullView(launchScreenVC)
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AVCaptureDevice.requestAccess(for: .video) { [view] granted in
            DispatchQueue.main.async {
                view?.window?.rootViewController = NavigationScannerViewControllerFactory.make(openScanner: granted)
            }
        }
    }
}
