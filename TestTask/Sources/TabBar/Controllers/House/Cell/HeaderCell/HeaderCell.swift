//
//  HeaderCell.swift
//  TestTask
//
//  Created by Sergio on 6.04.23.
//

import Foundation

import UIKit

class HeaderCell: UICollectionReusableView {

    static let identifier = "headerCell"

    // MARK: - UI elements

    lazy var categoriesLabel: UILabel = {
        let title = UILabel()
        title.font = .montserratSemiBold17()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    lazy var titleRightLabel: UILabel = {
        let title = UILabel()
        title.text = "View all"
        title.font = .montserratLight11()
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()


    // MARK: - Initializirs

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(categoriesLabel)
        addSubview(titleRightLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            categoriesLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoriesLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleRightLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleRightLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
