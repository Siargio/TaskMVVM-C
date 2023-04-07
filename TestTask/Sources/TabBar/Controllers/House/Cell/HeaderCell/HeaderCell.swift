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

    lazy var title: UILabel = {
        let title = UILabel()
        title.font = .montserratSemiBold17()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    lazy var titlee: UILabel = {
        let title = UILabel()
        title.text = "View all"
        title.font = .montserratLight11()
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
        addSubview(title)
        addSubview(titlee)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),

            titlee.trailingAnchor.constraint(equalTo: trailingAnchor),
            titlee.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        titlee.text = nil
    }
}
