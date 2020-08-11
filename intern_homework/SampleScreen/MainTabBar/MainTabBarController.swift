import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTab()
    }

    private func setTab() {
        let searchViewController: UINavigationController = R.storyboard.search.instantiateInitialViewController()!
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.search, tag: 1)
    // 仮ViewController。必要に応じて置き換えてください。
        let dummyViewController = UIViewController()
        dummyViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.contacts, tag: 2)
        
        setViewControllers([searchViewController, dummyViewController], animated: false)
    }
}
