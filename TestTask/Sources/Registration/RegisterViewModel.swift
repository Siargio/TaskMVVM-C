//
//  RegisterViewModel.swift
//  TestTask
//
//  Created by Sergio on 13.03.23.
//

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
