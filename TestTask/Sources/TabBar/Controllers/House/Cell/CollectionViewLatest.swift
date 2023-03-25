//
//  CollectionViewLatest.swift
//  TestTask
//
//  Created by Sergio on 25.03.23.
//

import UIKit

final class CollectionViewLatest: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = "cell"

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

//    let addButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "plus"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()

    let categoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Phones"
        label.textColor = .gray
        label.font = .montserratLight9()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupHierarchy()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(backgroundCellImage)
//        imageCircle.addSubview(addButton)
        addSubview(backgroundCategoriesImage)
        backgroundCategoriesImage.addSubview(categoriesLabel)
    }

    private func setLayout() {
        NSLayoutConstraint.activate([
            backgroundCellImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundCellImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundCellImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundCellImage.bottomAnchor.constraint(equalTo: bottomAnchor),

            backgroundCategoriesImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),


            categoriesLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoriesLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
