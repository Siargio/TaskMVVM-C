//
//  LoginViewModel.swift
//  TestTask
//
//  Created by Sergio on 13.03.23.
//

import Foundation

class LoginViewModel {
    
    weak var appCoordinator : AppCoordinator!

    func goToRegister(){
        appCoordinator.goToRegisterPage()
    }
}
