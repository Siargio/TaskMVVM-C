import Foundation

class MainTabBarViewModel {

    weak var appCoordinator : AppCoordinator?

    func goToRegister() {
        appCoordinator?.goToTabBarPage()
    }
}
