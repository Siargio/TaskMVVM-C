import UIKit

final class RegistrationView: UIView {

    // MARK: - UIElements

    private let singInLabel = UILabel(
        textAlignment: .center,
        text: R.Text.Register.singINg,
        font: .montserratSemiBold28(),
        textColor: CommonColor.customBlack)

    let firstNameTextField = UITextField(placeholder: R.Text.Register.placeholderName)

    let passwordTextField: UITextField = {
        let textField = UITextField(placeholder: R.Text.placeholderPassword)
        textField.setLeftPaddingPoints(Metric.setLeftPaddingPointsTextfield)
        textField.isSecureTextEntry = true
        textField.enablePasswordToggle()
        return textField
    }()

    let emailTextField = UITextField(placeholder: R.Text.placeholderEmail)

    let singInButton = UIButton(
        text: R.Text.Register.singINg,
        font: .montserratBold15(),
        tintColor: CommonColor.customWhiteText,
        backgroundColor: CommonColor.customPurpleButton)

    private let haveAccountLabel = UILabel(
        text: R.Text.Register.haveAccountLabelText,
        font: .montserratLight11(),
        textColor: CommonColor.customGrayColorAlready)

    let logInButton = UIButton(
        text: R.Text.Register.LoginButtonText,
        font: .montserratLight11(),
        tintColor: CommonColor.customPurpleLogIn,
        backgroundColor: .clear,
        alignment: .left)

    private let googleButton: UIButton = {
        let button = UIButton()
        let image = R.Image.Register.google
        button.setTitle(R.Text.Register.googleButtonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .montserratMedium14()
        button.setImage(image, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: Metric.titleEdgeInsets, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let appleButton: UIButton = {
        let button = UIButton()
        let image = R.Image.Register.apple
        button.setTitle(R.Text.Register.appleButtonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .montserratMedium14()
        button.setImage(image, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: Metric.titleEdgeInsets, bottom: 0, right: 0)
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

        stackViewLabelButton.addArrangedSubviews([haveAccountLabel, logInButton])

        stackViewAll.addArrangedSubviews([
            singInLabel,
            firstNameTextField,
            passwordTextField,
            emailTextField,
            singInButton,
            stackViewLabelButton,
            googleButton,
            appleButton
        ])
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackViewAll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metric.stackViewAllTopAnchor),
            stackViewAll.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metric.stackViewAllLeadingTrailing),
            stackViewAll.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metric.stackViewAllLeadingTrailing),
            stackViewAll.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor),

            firstNameTextField.heightAnchor.constraint(equalToConstant: Metric.allTextFieldHeight),
            emailTextField.heightAnchor.constraint(equalToConstant: Metric.allTextFieldHeight),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metric.allTextFieldHeight),
            singInButton.heightAnchor.constraint(equalToConstant: Metric.singInButtonHeight),
            stackViewLabelButton.heightAnchor.constraint(equalToConstant: Metric.stackViewLabelButtoHeight)
        ])

        stackViewAll.setCustomSpacing(Metric.stackViewAllSetCustomSpacing, after: singInLabel)
        stackViewAll.setCustomSpacing(Metric.stackViewAllSetCustomSpacingButton, after: singInButton)
        stackViewAll.setCustomSpacing(Metric.stackViewAllSetCustomSpacing, after: stackViewLabelButton)
    }
}

// MARK: - Metric

private extension RegistrationView {
    enum Metric {
        static let setLeftPaddingPointsTextfield: CGFloat = 10
        static let titleEdgeInsets: CGFloat = 20
        static let stackViewAllSpacing: CGFloat = 35
        static let stackViewAllTopAnchor: CGFloat = 110
        static let stackViewAllLeadingTrailing: CGFloat = 43
        static let allTextFieldHeight: CGFloat = 35
        static let singInButtonHeight: CGFloat = 50
        static let stackViewLabelButtoHeight: CGFloat = 15
        static let stackViewAllSetCustomSpacing: CGFloat = 90
        static let stackViewAllSetCustomSpacingButton: CGFloat = 15
    }
}
