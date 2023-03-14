//
//  RegistrationView.swift
//  TestTask
//
//  Created by Sergio on 14.03.23.
//

import UIKit

final class RegistrationView: UIView {

    // MARK: - UIElements
    private let singInLabel = UILabel(text: "Sign in", font: .montserratSemiBold28(), textColor: CommonColor.customBlack)

    private let firstNameTextField = UITextField(placeholder: "First name")

    private let lastNameTextField = UITextField(placeholder: "Last name")

    private let emailTextField = UITextField(placeholder: "Email")

    private let singInButton = UIButton(text: "Sing in", font: .montserratBold15(), tintColor: CommonColor.customWhiteText, backgroundColor: CommonColor.customPurpleButton)

    private let haveAccountLabel = UILabel(text: "Already have an account?", font: .montserratLight15(), textColor: CommonColor.customGrayColorAlready)

    private let logInButton = UIButton(text: "Log in", font: .montserratRegular15(), tintColor: CommonColor.customPurpleLogIn, backgroundColor: .clear)

    private let googleLabel = UILabel(text: "Sing in with Google", font: .montserratRegular15(), textColor: .black)

    private let appleLabel = UILabel(text: "Sing in with Apple", font: .montserratRegular15(), textColor: .black)

    private let googleImage = UIImageView(image: "google")

    private let appleImage = UIImageView(image: "apple")

    private lazy var stackViewTexField: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 35
        stackView.backgroundColor = .red
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupHierarchy() {
        addSubview(singInLabel)
        addSubview(stackViewTexField)

        addSubview(singInButton)
        addSubview(haveAccountLabel)
        addSubview(logInButton)
        addSubview(googleLabel)
        addSubview(appleLabel)
        addSubview(googleImage)
        addSubview(appleImage)

        stackViewTexField.addArrangedSubviews([
            firstNameTextField,
            lastNameTextField,
            emailTextField
        ])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            singInLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 65),
            singInLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            stackViewTexField.topAnchor.constraint(equalTo: singInLabel.bottomAnchor, constant: 77),
            stackViewTexField.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 43),
            stackViewTexField.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -43),
            stackViewTexField.heightAnchor.constraint(equalTo: super.heightAnchor, multiplier: 0.193),

            singInButton.topAnchor.constraint(equalTo: stackViewTexField.bottomAnchor, constant: 35),
            singInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 43),
            singInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -43),
            singInButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.063),

//            firstNameTextField.topAnchor.constraint(equalTo: singInLabel.bottomAnchor, constant: 77),
//            firstNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 43),
//            firstNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -43),
//            firstNameTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.04),
        ])
    }
}
