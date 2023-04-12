import UIKit

final class MainTabBarViewController: UITabBarController {

    var viewModel : MainTabBarViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarAppearance()
        setupTabBarViewControllers()
    }

    func setupTabBarViewControllers() {

        let houseViewController = HouseViewController()
        houseViewController.tabBarItem.image = R.Image.TabBar.house
        houseViewController.tabBarItem.selectedImage = R.Image.TabBar.houseSelect?.withRenderingMode(.alwaysOriginal)
        let navControllerHouse = UINavigationController(rootViewController: houseViewController)

        let favoriteViewController = FavoriteViewController()
        favoriteViewController.tabBarItem.image = R.Image.TabBar.heart
        favoriteViewController.tabBarItem.selectedImage = R.Image.TabBar.heartSelect?.withRenderingMode(.alwaysOriginal)
        let navControllerFavorite = UINavigationController(rootViewController: favoriteViewController)

        let shoppingViewController = ShoppingViewController()
        shoppingViewController.tabBarItem.image = R.Image.TabBar.cart
        shoppingViewController.tabBarItem.selectedImage = R.Image.TabBar.cartSelect?.withRenderingMode(.alwaysOriginal)
        let navControllerShopping = UINavigationController(rootViewController: shoppingViewController)

        let messageViewController = MessageViewController()
        messageViewController.tabBarItem.image = R.Image.TabBar.message
        messageViewController.tabBarItem.selectedImage = R.Image.TabBar.messageSelect?.withRenderingMode(.alwaysOriginal)
        let navControllerMessage = UINavigationController(rootViewController: messageViewController)


        let personViewController = PersonViewController()
        personViewController.tabBarItem.image = R.Image.TabBar.person
        personViewController.tabBarItem.selectedImage = R.Image.TabBar.messageSelect?.withRenderingMode(.alwaysOriginal)
        let navControllerPerson = UINavigationController(rootViewController: personViewController)

        let controllers = [navControllerHouse,
                           navControllerFavorite,
                           navControllerShopping,
                           navControllerMessage,
                           navControllerPerson]
        setViewControllers(controllers, animated: true)
    }

    private func setTabBarAppearance() {
        let width = tabBar.bounds.width
        let height = tabBar.bounds.height + 60

        let roundLayer = CAShapeLayer()

        let bezierPath = UIBezierPath(roundedRect: CGRect(x: 0, y: -20, width: width, height: height), cornerRadius: 30)

        roundLayer.path = bezierPath.cgPath

        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
    }
}
