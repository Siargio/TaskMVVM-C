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
        print("App Coordinator Start")
        goToRegisterPage()
    }

    func goToLoginPage(){
        // Instantiate LoginViewController
        let loginViewController = LoginViewController()
        // Instantiate LoginViewModel
        let loginViewModel = LoginViewModel.init()
        // Set the Coordinator to the ViewModel
        loginViewModel.appCoordinator = self
        // Set the ViewModel to ViewController
        loginViewController.viewModel = loginViewModel
        // Push it.
        navigationController.pushViewController(loginViewController, animated: true)
    }

    func goToRegisterPage(){
        let registerViewController = RegisterViewController()

        let registerViewModel = RegisterViewModel.init()

        registerViewModel.appCoordinator = self

        registerViewController.viewModel = registerViewModel

        navigationController.pushViewController(registerViewController, animated: true)
    }
}
