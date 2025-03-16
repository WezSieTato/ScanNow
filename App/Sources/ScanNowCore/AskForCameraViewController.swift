import AVKit
import UIKit

public final class AskForCameraViewController: UIViewController {
    private let launchScreenVC: UIViewController

    public init(launchScreenVC: UIViewController) {
        self.launchScreenVC = launchScreenVC
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllerOnFullView(launchScreenVC)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AVCaptureDevice.requestAccess(for: .video) { [view] granted in
            DispatchQueue.main.async {
                view?.window?.rootViewController = NavigationScannerViewControllerFactory.make(openScanner: granted)
            }
        }
    }
}
