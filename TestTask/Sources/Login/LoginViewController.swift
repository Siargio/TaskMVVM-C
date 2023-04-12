import UIKit

class LoginViewController: UIViewController {

    // MARK: - Property

    var viewModel : LoginViewModel?
    private let customView = LoginView()

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
        customView.loginButton.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
    }

    @objc func tapLoginButton() {

        let email = customView.emailTexField.text ?? ""
        let password = customView.passwordTextField.text ?? ""
        let user = findUserDataBase(email: email)

        if user == nil {
            alertOk(title: R.Text.Login.alertError, message: "")
        } else if user?.password == password {
            UserDefaults.standard.set(true, forKey: R.Text.userDefaultsKey)
            viewModel?.goToRegister()
            guard let activeUser = user else { return }
            DataBase.shard.saveActiveUser(user: activeUser)
        } else {
            alertOk(title: R.Text.Login.alertWrongPassword, message: "")
        }
    }

    private func findUserDataBase(email: String) -> RegisterUserModel? {
        let dataBase = DataBase.shard.users

        for user in dataBase {
            if user.email == email {
                return user
            }
        }
        return nil
    }
}
