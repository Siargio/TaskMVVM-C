import UIKit

final class CollectionViewLatest: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = R.Text.Home.identifierLatest

    // MARK: - UIElements

    let backgroundCellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let backgroundCategoriesImage: UIImageView = {
        let image = R.Image.Home.backgroundCategoriesImage
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let categoriesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .montserratLight6()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let productLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .montserratSemiBold8()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .montserratSemiBold9()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let addProductButton: UIButton = {
        let button = UIButton()
        button.setImage(R.Image.Home.circlePlus, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setLayout()
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupCell() {
        backgroundColor = .clear
        layer.cornerRadius = 15
        clipsToBounds = true
    }

    private func setupHierarchy() {
        addSubview(backgroundCellImage)
        addSubview(backgroundCategoriesImage)
        backgroundCategoriesImage.addSubview(categoriesLabel)
        addSubview(priceLabel)
        addSubview(productLabel)
        addSubview(addProductButton)
    }

    private func setLayout() {
        NSLayoutConstraint.activate([
            backgroundCellImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundCellImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundCellImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundCellImage.bottomAnchor.constraint(equalTo: bottomAnchor),

            addProductButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            addProductButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),

            categoriesLabel.centerYAnchor.constraint(equalTo: backgroundCategoriesImage.centerYAnchor),
            categoriesLabel.centerXAnchor.constraint(equalTo: backgroundCategoriesImage.centerXAnchor),

            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),

            productLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            productLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -5),
            productLabel.widthAnchor.constraint(equalToConstant: 80),
            productLabel.heightAnchor.constraint(equalToConstant: 25),

            backgroundCategoriesImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCategoriesImage.bottomAnchor.constraint(equalTo: productLabel.topAnchor),
        ])
    }

    func configure(model: Latest) {
        categoriesLabel.text = model.category
        productLabel.text = model.name
        priceLabel.text = "$ \(model.price ?? 0)"
        backgroundCellImage.loadFrom(URLAddress: model.imageURL ?? "")
    }
}
