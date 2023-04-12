import Foundation

class LoginViewModel {
    
    weak var appCoordinator : AppCoordinator?

    func goToRegister(){
        appCoordinator?.goToTabBarPage()
    }
}
