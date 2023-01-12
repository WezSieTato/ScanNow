import AVKit
import UIKit

final class AskForCameraViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let childVC = Storyboards.LaunchScreen.initialScene.instantiate()
        addChildViewControllerOnFullView(childVC)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AVCaptureDevice.requestAccess(for: .video) { [view] _ in
            DispatchQueue.main.async {
                view?.window?.rootViewController = NavigationScannerViewControllerFactory.make()
            }
        }
    }
}
