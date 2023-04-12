import UIKit

final class PersonView: UIView {

    // MARK: - UIElements

    let profileImage: UIImageView = {
        let image = R.Image.Home.profileImage
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let changePhotoButton = UIButton(
        text: R.Text.Home.changePhotoButtonText,
        font: .montserratLight9(),
        tintColor: CommonColor.customGrayTex,
        backgroundColor: .clear)

    private let nameLabel = UILabel(
        textAlignment: .center,
        text: R.Text.Home.nameLabelText,
        font: .montserratBold16(),
        textColor: CommonColor.customBlack)

    private let uploadItemButton = UIButton(
        text: R.Text.Home.uploadItemButtonText,
        font: .montserratSemiBold15(),
        tintColor: CommonColor.customWhiteText,
        backgroundColor: CommonColor.customPurpleButton)

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(BaseCell.self, forCellReuseIdentifier: R.Text.Home.identifierBaseCell)
        tableView.register(CellWithChevron.self, forCellReuseIdentifier: R.Text.Home.identifierCellWithChevron)
        tableView.register(BalanceCell.self, forCellReuseIdentifier: R.Text.Home.identifierBalanceCell)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        backgroundColor = CommonColor.backgroundColor
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(profileImage)
        addSubview(changePhotoButton)
        addSubview(nameLabel)
        addSubview(uploadItemButton)
        addSubview(tableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            profileImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08),
            profileImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08),

            changePhotoButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor),
            changePhotoButton.centerXAnchor.constraint(equalTo: centerXAnchor),

            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: changePhotoButton.bottomAnchor, constant: 10),

            uploadItemButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            uploadItemButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            uploadItemButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 43),
            uploadItemButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -43),
            uploadItemButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),

            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: uploadItemButton.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
