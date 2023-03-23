//
//  ViewController.swift
//  TestTask
//
//  Created by Sergio on 13.03.23.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Property

    var viewModel : LoginViewModel!
    private let customView = LoginView()

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
        customView.loginButton.addTarget(self, action: #selector(goTOHouseScreen), for: .touchUpInside)
    }

    @objc func goTOHouseScreen() {
        viewModel.goToRegister()
    }
}
