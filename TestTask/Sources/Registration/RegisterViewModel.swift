import Foundation

class RegisterViewModel {

    weak var appCoordinator : AppCoordinator?

    func goToLogin() {
        appCoordinator?.goToLoginPage()
    }

    func gotoTabBar() {
        appCoordinator?.goToTabBarPage()
    }
}
