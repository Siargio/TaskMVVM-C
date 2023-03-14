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

    }
    
}
