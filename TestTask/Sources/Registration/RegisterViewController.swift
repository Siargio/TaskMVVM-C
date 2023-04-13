import UIKit

final class RegisterViewController: UIViewController {

    var viewModel : RegisterViewModel?
    private let customView = RegistrationView()

    let nameValidType: String.ValidTypes = .name
    let emailValueType: String.ValidTypes = .email
    let passwordValueType: String.ValidTypes = .password

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
        customView.singInButton.addTarget(self, action: #selector(registrationUser), for: .touchUpInside)
        customView.logInButton.addTarget(self, action: #selector(goTOLoginScreen), for: .touchUpInside)
    }

    @objc func goTOLoginScreen() {
        viewModel?.goToLogin()
    }

    @objc func registrationUser() {

        let firstNameText = customView.firstNameTextField.text ?? ""
        let emailText = customView.emailTextField.text ?? ""
        let passwordText = customView.passwordTextField.text ?? ""
        let user = findUserDataBase(email: emailText)

        if user?.email == emailText {
            alertOk(title: R.Text.Register.alertError, message: "")
        } else if firstNameText.isValid(validType: nameValidType)
            && passwordText.isValid(validType: passwordValueType)
            && emailText.isValid(validType: emailValueType) == true {

            DataBase.shard.saveUser(
                name: firstNameText,
                password: passwordText,
                email: emailText)

            viewModel?.goToLogin()
        } else {
            alertOk(title: R.Text.Register.alertCheck, message: "")
        }
    }

    private func findUserDataBase(email: String) -> RegisterUserModel? { 
        let dataBase = DataBase.shard.users
        //print(dataBase)

        for user in dataBase {
            if user.email == email {
                return user
            }
        }
        return nil
    }
}
