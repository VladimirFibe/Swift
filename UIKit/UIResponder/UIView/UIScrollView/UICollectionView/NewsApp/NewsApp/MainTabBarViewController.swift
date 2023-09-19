import UIKit

final class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        view.backgroundColor = .systemBackground
        let main = UINavigationController(rootViewController: NewsViewController())
        let search = UINavigationController(rootViewController: NewsViewController())
        main.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        search.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        setViewControllers([main, search], animated: true)
    }
}
