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

    func startUser() {
        startTabBarPage()
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

    func startTabBarPage() {
        let mainTabBarController = MainTabBarViewController()
        let mainTabBarViewModel = MainTabBarViewModel.init()
        mainTabBarViewModel.appCoordinator = self
        mainTabBarController.viewModel = mainTabBarViewModel
        navigationController.pushViewController(mainTabBarController, animated: true)
    }

    func goToTabBarPage() {
        let mainTabBarController = MainTabBarViewController()
        let mainTabBarViewModel = MainTabBarViewModel.init()
        mainTabBarViewModel.appCoordinator = self
        mainTabBarController.viewModel = mainTabBarViewModel
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.present(mainTabBarController, animated: true)
    }
}
