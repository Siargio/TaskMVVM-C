import UIKit

class BaseCell: UITableViewCell {

    //MARK: - UIElements

    let imageCircle: UIImageView = {
        let image = R.Image.Home.circle
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let imageCreditCard: UIImageView = {
        let image = R.Image.Home.imageCreditCard
        let imageView = UIImageView(image: image)
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let label = UILabel(textAlignment: .left, text: "", font: .montserratMedium14(), textColor: CommonColor.customBlack)

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    func configuration(data: Setups?) {
        imageCreditCard.image = data?.imageInCircle
        label.text = data?.labelInfo
    }

    private func setupHierarchy() {
        addSubview(imageCircle)
        imageCircle.addSubview(imageCreditCard)
        addSubview(label)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageCreditCard.centerYAnchor.constraint(equalTo: imageCircle.centerYAnchor),
            imageCreditCard.centerXAnchor.constraint(equalTo: imageCircle.centerXAnchor),

            imageCircle.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageCircle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),

            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: imageCircle.trailingAnchor, constant: 10)
        ])
    }
}
