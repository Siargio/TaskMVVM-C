import UIKit

final class LoginView: UIView {

    // MARK: - UIElements

    private let welcomeLabel = UILabel(textAlignment: .center, text: R.Text.Login.welcomeLabelText, font: .montserratSemiBold28(), textColor: CommonColor.customBlack)

    let emailTexField = UITextField(placeholder: R.Text.placeholderEmail)

    let passwordTextField: UITextField = {
        let textField = UITextField(placeholder: R.Text.placeholderPassword)
        textField.setLeftPaddingPoints(Metric.setLeftPaddingPointsTextfield)
        textField.isSecureTextEntry = true
        textField.enablePasswordToggle()
        return textField
    }()

    let loginButton = UIButton(text: R.Text.Login.loginButtonText, font: .montserratBold15(), tintColor: CommonColor.customWhiteText, backgroundColor: CommonColor.customPurpleButton)

    private let stackViewAll: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = Metric.stackViewAllSpacing
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
            stackViewAll.topAnchor.constraint(equalTo: topAnchor, constant: Metric.stackViewAllTopAnchor),
            stackViewAll.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.stackViewAllLeadingTrailing),
            stackViewAll.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.stackViewAllLeadingTrailing),
            stackViewAll.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),

            emailTexField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Metric.texFieldMultiplier),
            passwordTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Metric.texFieldMultiplier),
            loginButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Metric.loginButtonMultiplier)
        ])

        stackViewAll.setCustomSpacing(Metric.stackViewAllSetCustomSpacingWelcomeLabel, after: welcomeLabel)
        stackViewAll.setCustomSpacing(Metric.stackViewAllSetCustomSpacingPasswordTextField, after: passwordTextField)
    }
}

// MARK: - Metric

private extension LoginView {
    enum Metric {
        static let setLeftPaddingPointsTextfield: CGFloat = 10
        static let stackViewAllSpacing: CGFloat = 35
        static let stackViewAllTopAnchor: CGFloat = 155
        static let stackViewAllLeadingTrailing: CGFloat = 43
        static let texFieldMultiplier: CGFloat = 0.04
        static let loginButtonMultiplier: CGFloat = 0.06
        static let stackViewAllSetCustomSpacingWelcomeLabel: CGFloat = 75
        static let stackViewAllSetCustomSpacingPasswordTextField: CGFloat = 99
    }
}
