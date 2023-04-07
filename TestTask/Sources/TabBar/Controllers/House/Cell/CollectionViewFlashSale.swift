//
//  CollectionViewFlashSale.swift
//  TestTask
//
//  Created by Sergio on 5.04.23.
//

import UIKit

final class CollectionViewFlashSale: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = "collectionViewFlashSale"

    // MARK: - UIElements

    let backgroundCellImage: UIImageView = {
        let image = UIImage(named: "backgroundCell2")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let backgroundCategoriesImage: UIImageView = {
        let image = UIImage(named: "backgroundCategoriesBig")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let backgroundSaleImage: UIImageView = {
        let image = UIImage(named: "saleBackground")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let humanIkonImage: UIImageView = {
        let image = UIImage(named: "humanIkon")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let categoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Kids"
        label.textColor = .black
        label.font = .montserratLight9()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let saleLabel: UILabel = {
        let label = UILabel()
        label.text = "30% off"
        label.textColor = .white
        label.font = .montserratSemiBold10()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let productLabel: UILabel = {
        let label = UILabel()
        label.text = "New balance sneakers"
        label.textColor = .white
        label.font = .montserratSemiBold14()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let costLabel: UILabel = {
        let label = UILabel()
        label.text = "$ 33,00"
        label.textColor = .white
        label.font = .montserratSemiBold12()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let addProductButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "circlePlusBig"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let addLikeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "circleHeart"), for: .normal)
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
        addSubview(addLikeButton)
        addSubview(backgroundSaleImage)
        backgroundSaleImage.addSubview(saleLabel)
        addSubview(humanIkonImage)
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

            costLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            costLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),

            productLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            productLabel.bottomAnchor.constraint(equalTo: costLabel.topAnchor, constant: -20),
            productLabel.widthAnchor.constraint(equalToConstant: 100),

            backgroundCategoriesImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCategoriesImage.bottomAnchor.constraint(equalTo: productLabel.topAnchor, constant: -10),

            addLikeButton.trailingAnchor.constraint(equalTo: addProductButton.leadingAnchor, constant: -5),
            addLikeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9),

            saleLabel.centerXAnchor.constraint(equalTo: backgroundSaleImage.centerXAnchor),
            saleLabel.centerYAnchor.constraint(equalTo: backgroundSaleImage.centerYAnchor),

            backgroundSaleImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            backgroundSaleImage.topAnchor.constraint(equalTo: topAnchor, constant: 8),

            humanIkonImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            humanIkonImage.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        ])
    }
}
