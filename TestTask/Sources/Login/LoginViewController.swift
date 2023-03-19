//
//  ViewController.swift
//  TestTask
//
//  Created by Sergio on 13.03.23.
//

import UIKit

class LoginViewController: UIViewController {

    var viewModel : LoginViewModel!
    private let customView = LoginView()

    // MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    // MARK: - Setup

}
