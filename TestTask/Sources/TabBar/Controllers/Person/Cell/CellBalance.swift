import UIKit

final class BalanceCell: BaseCell {

    // MARK: - UIElements

    private lazy var balanceLabel: UILabel = {
        let labelRight = UILabel()
        labelRight.textColor = .black
        labelRight.translatesAutoresizingMaskIntoConstraints = false
        return labelRight
    }()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupHierarchy() {
        self.addSubview(balanceLabel)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            balanceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            balanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
        ])
    }

    override func configuration(data: Setups?) {
        super.configuration(data: data)
        balanceLabel.text = data?.balance
    }
}
