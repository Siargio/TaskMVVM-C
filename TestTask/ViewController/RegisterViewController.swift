//
//  RegisterViewController.swift
//  TestTask
//
//  Created by Sergio on 13.03.23.
//

import UIKit

class RegisterViewController: UIViewController {

    var viewModel : RegisterViewModel!

    // MARK: - UIElements
    lazy var singInLabel = UILabel(text: "Sign in", font: .montserratSemiBold28(), textColor: CommonColor.customBlack)

    lazy var firstNameTextField = UITextField(placeholder: "First name")

    lazy var lastNameTextField = UITextField(placeholder: "Last name")

    lazy var emailTextField = UITextField(placeholder: "Email name")

    lazy var singInButton = UIButton(text: "Sing in", font: .montserratRegular15(), tintColor: CommonColor.customWhiteText, backgroundColor: CommonColor.customPurpleButton)

    lazy var haveAccountLabel = UILabel(text: "Already have an account?", font: .montserratLight15(), textColor: CommonColor.customGrayColorAlready)

    lazy var logInButton = UIButton(text: "Log in", font: .montserratRegular15(), tintColor: CommonColor.customPurpleLogIn, backgroundColor: .clear)

    lazy var googleLabel = UILabel(text: "Sing in with Google", font: .montserratRegular15(), textColor: .black)

    lazy var appleLabel = UILabel(text: "Sing in with Apple", font: .montserratRegular15(), textColor: .black)

    lazy var googleImage = UIImageView(image: "google")

    lazy var appleImage = UIImageView(image: "apple")

    private let stackViewTexField = UIStackView() 
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup
    private func setupHierarchy() {
        view.addSubview(singInLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(emailTextField)
        view.addSubview(singInButton)
        view.addSubview(haveAccountLabel)
        view.addSubview(logInButton)
        view.addSubview(googleLabel)
        view.addSubview(appleLabel)
        view.addSubview(googleImage)
        view.addSubview(appleImage)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            singInLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            singInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            firstNameTextField.topAnchor.constraint(equalTo: singInLabel.bottomAnchor, constant: 77),
            firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -43),
            firstNameTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04),
        ])
    }
}
