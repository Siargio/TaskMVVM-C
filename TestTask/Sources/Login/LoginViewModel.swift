import Foundation

class LoginViewModel {
    
    weak var appCoordinator : AppCoordinator?

    func goToTabBarPage(){
        appCoordinator?.goToTabBarPage()
    }
}
