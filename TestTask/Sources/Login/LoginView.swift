//
//  LoginView.swift
//  TestTask
//
//  Created by Sergio on 19.03.23.
//

import UIKit

final class LoginView: UIView {

    // MARK: - UIElements

    private let welcomeLabel = UILabel(textAlignment: .center, text: "Welcome back", font: .montserratSemiBold28(), textColor: CommonColor.customBlack)

    let emailTexField = UITextField(placeholder: "Email")

    let passwordTextField: UITextField = {
        let textField = UITextField(placeholder: "Password")
        textField.setLeftPaddingPoints(10)
        textField.isSecureTextEntry = true
        textField.enablePasswordToggle()
        return textField
    }()

    let loginButton = UIButton(text: "Login", font: .montserratBold15(), tintColor: CommonColor.customWhiteText, backgroundColor: CommonColor.customPurpleButton)

    private let stackViewAll: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 35
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
        backgroundColor = CommonColor.backgroundColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(stackViewAll)
        stackViewAll.addArrangedSubviews([
            welcomeLabel,
            emailTexField,
            passwordTextField,
            loginButton
        ])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackViewAll.topAnchor.constraint(equalTo: topAnchor, constant: 155),
            stackViewAll.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 43),
            stackViewAll.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -43),
            stackViewAll.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),

            emailTexField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.04),
            passwordTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.04),
            loginButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.06)
        ])

        stackViewAll.setCustomSpacing(75, after: welcomeLabel)
        stackViewAll.setCustomSpacing(99, after: passwordTextField)
    }
}
