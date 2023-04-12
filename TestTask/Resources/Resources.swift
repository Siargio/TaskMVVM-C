import UIKit

typealias R = Resources

enum Resources {

    // MARK: - Image

    enum Image {
        enum Register {
            static let google = UIImage(named: "google")
            static let apple = UIImage(named: "apple")
        }

        enum TabBar {
            static let house = UIImage(named: "house")
            static let houseSelect = UIImage(named: "houseSelect")
            static let heart = UIImage(named: "heart")
            static let heartSelect = UIImage(named: "heartSelect")
            static let cart = UIImage(named: "cart")
            static let cartSelect = UIImage(named: "cartSelect")
            static let message = UIImage(named: "message")
            static let messageSelect = UIImage(named: "messageSelect")
            static let person = UIImage(named: "person")
            static let personSelect = UIImage(named: "personSelect")
        }

        enum Home {
            static let leftBarButtonItem = UIImage(named: "leftButton")
            static let imageNavBar = UIImage(named: "personPhoto")
            static let locationButtonImage = UIImage(named: "imageLocation")
            static let magnifyingGlass = UIImage(systemName: "magnifyingglass")
            static let backgroundCategoriesImage = UIImage(named: "backgroundCategories")
            static let circlePlus = UIImage(named: "circlePlus")
            static let circle = UIImage(named: "circle")
            static let phone = UIImage(named: "phone")
            static let backgroundCategoriesImageBig = UIImage(named: "backgroundCategoriesBig")
            static let backgroundSaleImage = UIImage(named: "saleBackground")
            static let humanIkon = UIImage(named: "humanIkon")
            static let circlePlusBig = UIImage(named: "circlePlusBig")
            static let circleHeart = UIImage(named: "circleHeart")
            static let backgroundCellBrands = UIImage(named: "backgroundCell")
            static let profileImage = UIImage(named: "personPhotoProfile")
            static let imageCreditCard = UIImage(systemName: "creditcard")
            static let imageChevron = UIImage(named: "chevron")
        }
    }

    // MARK: - Text

    enum Text {
        static let userDefaultsKey = "userLogged"
        static let placeholderPassword = "Password"
        static let placeholderEmail = "Email"

        enum Register {
            static let alertError = "Пользователь с таким эмейлом уже зарегистрирован"
            static let alertCheck = "Проверьте введенные данные"
            static let singINg = "Sign in"
            static let placeholderName = "Name"
            static let haveAccountLabelText = "Already have an account?"
            static let LoginButtonText = "   Log in"
            static let googleButtonTitle = "Sing in with Google"
            static let appleButtonTitle = "Sing in with Apple"
        }

        enum Login {
            static let alertError = "Пользователь не найден"
            static let alertWrongPassword = "Не верный пароль"
            static let welcomeLabelText = "Welcome back"
            static let loginButtonText = "Login"
        }

        enum Home {
            static let searchPlaceHolderText = "What are you looking for?"
            static let headerLatest = "Latest"
            static let headerFlashSale = "Flash Sale"
            static let headerBrands = "Brands"
            static let locationButtonTitle = "Location"
            static let searchTextFieldKey = "searchField"
            static let headerCellIdentifier = "headerCell"
            static let titleRightLabelText = "View all"
            static let identifierCategories = "collectionViewCategories"
            static let identifierLatest = "collectionViewLatest"
            static let identifierFlashSale = "collectionViewFlashSale"
            static let identifierBrands = "collectionViewBrands"
            static let categoriesLabelPhones = "Phones"
            static let productLabelSamsung = "Samsung S10"
            static let costLabel = "$ 180,000"
            static let titleProfile = "Profile"
            static let changePhotoButtonText = "Change photo"
            static let nameLabelText = "Satria Adhi Pradana"
            static let uploadItemButtonText = "Upload item"
            static let identifierBaseCell = "BaseCell"
            static let identifierCellWithChevron = "CellWithChevron"
            static let identifierBalanceCell = "BalanceCell"
        }

        enum Url {
            static let urlLatest = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
            static let urlFlashSale = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
        }
    }
}
