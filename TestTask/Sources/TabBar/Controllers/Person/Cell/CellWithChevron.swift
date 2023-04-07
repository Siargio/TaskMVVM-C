//
//  Cell.swift
//  TestTask
//
//  Created by Sergio on 22.03.23.
//

import UIKit

final class CellWithChevron: BaseCell {

    //MARK: - UIElements

    let imageChevron: UIImageView = {
        let image = UIImage(named: "chevron")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

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

    private func setupHierarchy() {
        addSubview(imageChevron)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageChevron.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageChevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45)
        ])
    }

    override func configuration(data: Setups?) {
        super.configuration(data: data)
        imageChevron.image = data?.chevron
    }
}
