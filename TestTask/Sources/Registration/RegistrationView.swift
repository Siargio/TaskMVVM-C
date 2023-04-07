//
//  RegistrationView.swift
//  TestTask
//
//  Created by Sergio on 14.03.23.
//

import UIKit

final class RegistrationView: UIView {

    // MARK: - UIElements

    private let singInLabel = UILabel(
        textAlignment: .center,
        text: "Sign in",
        font: .montserratSemiBold28(),
        textColor: CommonColor.customBlack)

    private let firstNameTextField = UITextField(placeholder: "First name")

    private let lastNameTextField = UITextField(placeholder: "Last name")

    private let emailTextField = UITextField(placeholder: "Email")

    let singInButton = UIButton(
        text: "Sing in",
        font: .montserratBold15(),
        tintColor: CommonColor.customWhiteText,
        backgroundColor: CommonColor.customPurpleButton)

    private let haveAccountLabel = UILabel(
        text: "Already have an account?",
        font: .montserratLight11(),
        textColor: CommonColor.customGrayColorAlready)

    let logInButton = UIButton(
        text: "   Log in",
        font: .montserratLight11(),
        tintColor: CommonColor.customPurpleLogIn,
        backgroundColor: .clear,
        alignment: .left)

    private let googleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "google")
        button.setTitle("Sing in with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .montserratMedium14()
        button.setImage(image, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let appleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "apple")
        button.setTitle("Sing in with Apple", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .montserratMedium14()
        button.setImage(image, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var stackViewLabelButton: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var stackViewAll: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
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

        stackViewLabelButton.addArrangedSubviews([haveAccountLabel, logInButton])

        stackViewAll.addArrangedSubviews([
            singInLabel,
            firstNameTextField,
            lastNameTextField,
            emailTextField,
            singInButton,
            stackViewLabelButton,
            googleButton,
            appleButton
        ])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackViewAll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 110),
            stackViewAll.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 43),
            stackViewAll.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -43),
            stackViewAll.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor),

            firstNameTextField.heightAnchor.constraint(equalToConstant: 35),
            emailTextField.heightAnchor.constraint(equalToConstant: 35),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 35),
            singInButton.heightAnchor.constraint(equalToConstant: 50),
            stackViewLabelButton.heightAnchor.constraint(equalToConstant: 15)
        ])


        stackViewAll.setCustomSpacing(90, after: singInLabel)
        stackViewAll.setCustomSpacing(15, after: singInButton)
        stackViewAll.setCustomSpacing(90, after: stackViewLabelButton)
    }
}
