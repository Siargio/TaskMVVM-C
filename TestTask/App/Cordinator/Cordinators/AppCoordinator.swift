//
//  AppCoordinator.swift
//  TestTask
//
//  Created by Sergio on 13.03.23.
//

import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navCon : UINavigationController) {
        self.navigationController = navCon
    }

    func start() {
        goToRegisterPage()
    }

    func goToRegisterPage() {
        let registerViewController = RegisterViewController()
        let registerViewModel = RegisterViewModel.init()
        registerViewModel.appCoordinator = self
        registerViewController.viewModel = registerViewModel
        navigationController.pushViewController(registerViewController, animated: true)
    }

    func goToLoginPage() {
        let loginViewController = LoginViewController()
        let loginViewModel = LoginViewModel.init()
        loginViewModel.appCoordinator = self
        loginViewController.viewModel = loginViewModel
        navigationController.pushViewController(loginViewController, animated: true)
    }

    func goToTabBarPage() {
        let mainTabBarController = MainTabBarViewController()
        let mainTabBarViewModel = MainTabBarViewModel.init()
        mainTabBarViewModel.appCoordinator = self
        mainTabBarController.viewModel = mainTabBarViewModel
        navigationController.pushViewController(mainTabBarController, animated: true)
    }
}
