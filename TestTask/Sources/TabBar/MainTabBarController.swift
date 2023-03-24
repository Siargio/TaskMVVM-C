//
//  MainTabBarController.swift
//  TestTask
//
//  Created by Sergio on 20.03.23.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    var viewModel : MainTabBarViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarAppearance()
        setupTabBarViewControllers()
    }

    func setupTabBarViewControllers() {

        let houseViewController = HouseViewController()
        houseViewController.tabBarItem.image = UIImage(systemName: "house")

        let favoriteViewController = FavoriteViewController()
        favoriteViewController.tabBarItem.image = UIImage(systemName: "heart")

        let shoppingViewController = ShoppingViewController()
        shoppingViewController.tabBarItem.image = UIImage(systemName: "cart")

        let messageViewController = MessageViewController()
        messageViewController.tabBarItem.image = UIImage(systemName: "message")

        let personViewController = PersonViewController()
        personViewController.tabBarItem.image = UIImage(systemName: "person")

        let controllers = [houseViewController,
                           favoriteViewController,
                           shoppingViewController,
                           messageViewController,
                           personViewController]
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

        tabBar.tintColor = CommonColor.customColorItemTabBarPressed
        tabBar.unselectedItemTintColor = CommonColor.customColorItemTabBar

        roundLayer.fillColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
    }
}
