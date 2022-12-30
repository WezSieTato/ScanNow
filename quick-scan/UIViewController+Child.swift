import UIKit

extension UIViewController {
    func addChildViewControllerOnFullView(_ childVC: UIViewController) {
        let childView = childVC.view!
        childView.translatesAutoresizingMaskIntoConstraints = false
        childVC.willMove(toParent: self)
        view.addSubview(childView)
        addChild(childVC)
        childVC.didMove(toParent: self)

        NSLayoutConstraint.activate([
            childView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            childView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            childView.topAnchor.constraint(equalTo: view.topAnchor),
            childView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
