//
//  MainTabBarViewModel.swift
//  TestTask
//
//  Created by Sergio on 20.03.23.
//

import Foundation

class MainTabBarViewModel {

    weak var appCoordinator : AppCoordinator!

    func goToRegister(){
        appCoordinator.goToTabBarPage()
    }
}
