//
//  RegisterViewController.swift
//  TestTask
//
//  Created by Sergio on 13.03.23.
//

import UIKit

final class RegisterViewController: UIViewController {

    var viewModel : RegisterViewModel!
    private let customView = RegistrationView()

    // MARK: - LifeCycle
    
    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        creatingActionButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    // MARK: - Setups
    
    private func creatingActionButton() {
        customView.singInButton.addTarget(self, action: #selector(goTOHouseScreen), for: .touchUpInside)

        customView.logInButton.addTarget(self, action: #selector(goTOLoginScreen), for: .touchUpInside)
    }

    @objc func goTOLoginScreen() {
        viewModel.goToLogin()
    }

    @objc func goTOHouseScreen() {
        viewModel.gotoTabBar()
    }
}
