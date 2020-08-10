import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTab()
    }

    private func setTab() {
        let searchViewController: UINavigationController = R.storyboard.search.instantiateInitialViewController()!

    // 仮ViewController。必要に応じて置き換えてください。
        let dummyViewController = UIViewController()

        setViewControllers([searchViewController, dummyViewController], animated: false)
    }
}
