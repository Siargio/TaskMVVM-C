//
//  CollectionViewBrands.swift
//  TestTask
//
//  Created by Sergio on 6.04.23.
//

import UIKit

final class CollectionViewBrands: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = "collectionViewBrands"

    // MARK: - UIElements

    let backgroundCellImage: UIImageView = {
        let image = UIImage(named: "backgroundCell")
        let imageView = UIImageView(image: image)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let backgroundCategoriesImage: UIImageView = {
        let image = UIImage(named: "backgroundCategories")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

        let categoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Phones"
        label.textColor = .black
        label.font = .montserratLight6()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let productLabel: UILabel = {
        let label = UILabel()
        label.text = "Samsung S10"
        label.textColor = .white
        label.font = .montserratSemiBold10()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let costLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 180,000"
        label.textColor = .white
        label.font = .montserratSemiBold9()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let addProductButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "circlePlus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setLayout()
        backgroundColor = .clear
        layer.cornerRadius = 15
        clipsToBounds = true

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(backgroundCellImage)
        addSubview(backgroundCategoriesImage)
        backgroundCategoriesImage.addSubview(categoriesLabel)
        addSubview(costLabel)
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

            costLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            costLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),

            productLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            productLabel.bottomAnchor.constraint(equalTo: costLabel.topAnchor, constant: -15),
            productLabel.widthAnchor.constraint(equalToConstant: 70),

            backgroundCategoriesImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCategoriesImage.bottomAnchor.constraint(equalTo: productLabel.topAnchor, constant: -5),
        ])
    }
}

