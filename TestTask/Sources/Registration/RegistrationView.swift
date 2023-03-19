//
//  RegistrationView.swift
//  TestTask
//
//  Created by Sergio on 14.03.23.
//

import UIKit

final class RegistrationView: UIView {

    // MARK: - UIElements

    private let singInLabel = UILabel(textAlignment: .center,
                                      text: "Sign in",
                                      font: .montserratSemiBold28(),
                                      textColor: CommonColor.customBlack)

    private let firstNameTextField = UITextField(placeholder: "First name")

    private let lastNameTextField = UITextField(placeholder: "Last name")

    private let emailTextField = UITextField(placeholder: "Email")

    private let singInButton = UIButton(text: "Sing in",
                                        font: .montserratBold15(),
                                        tintColor: CommonColor.customWhiteText,
                                        backgroundColor: CommonColor.customPurpleButton)

    private let haveAccountLabel = UILabel(text: "Already have an account?",
                                           font: .montserratLight11(),
                                           textColor: CommonColor.customGrayColorAlready)

    private let logInButton = UIButton(text: "Log in",
                                       font: .montserratLight11(),
                                       tintColor: CommonColor.customPurpleLogIn,
                                       backgroundColor: .clear)

    private let googleButton = UIButton(text: "Sing in with Google",
                                        font: .montserratMedium14(),
                                        tintColor: .black,
                                        backgroundColor: .clear)

    private let appleButton = UIButton(text: "Sing in with Apple",
                                       font: .montserratMedium14(),
                                       tintColor: .black,
                                       backgroundColor: .clear)

    private let googleImage = UIImageView(image: "google")

    private let appleImage = UIImageView(image: "apple")

    private lazy var stackViewLabelButton: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.backgroundColor = .green
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var stackViewGoogle: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.backgroundColor = .red
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var stackViewApple: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.backgroundColor = .blue
        return stackView
    }()

    private lazy var stackViewAll: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 35
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Init

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
        addSubview(stackViewAll)

        stackViewLabelButton.addArrangedSubviews([haveAccountLabel, logInButton])
        stackViewGoogle.addArrangedSubviews([googleImage, googleButton])
        stackViewApple.addArrangedSubviews([appleImage, appleButton])
        stackViewAll.addArrangedSubviews([
            singInLabel,
            firstNameTextField,
            lastNameTextField,
            emailTextField,
            singInButton,
            stackViewLabelButton,
            stackViewGoogle,
            stackViewApple,
        ])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackViewAll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackViewAll.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 43),
            stackViewAll.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -43),
            stackViewAll.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
