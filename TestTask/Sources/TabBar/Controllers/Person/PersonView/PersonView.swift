//
//  PersonView.swift
//  TestTask
//
//  Created by Sergio on 20.03.23.
//

import UIKit

final class PersonView: UIView {

    // MARK: - UIElements

    let profilImage: UIImageView = {
        let image = UIImage(named: "heart")
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let changePhotoButton = UIButton(
        text: "Change photo",
        font: .montserratLight9(),
        tintColor: CommonColor.customGrayTex,
        backgroundColor: .clear)

    private let nameLabel = UILabel(
        textAlignment: .center,
        text: "Satria Adhi Pradana",
        font: .montserratBold16(),
        textColor: CommonColor.customBlack)

    private let uploadtItemButton = UIButton(
        text: "Upload item",
        font: .montserratSemiBold15(),
        tintColor: CommonColor.customWhiteText,
        backgroundColor: CommonColor.customPurpleButton)

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(BaseCell.self, forCellReuseIdentifier: "BaseCell")
        tableView.register(CellWithChevron.self, forCellReuseIdentifier: "CellWithChevron")
        tableView.register(BalanceCell.self, forCellReuseIdentifier: "BalanceCell")
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
        addSubview(profilImage)
        addSubview(changePhotoButton)
        addSubview(nameLabel)
        addSubview(uploadtItemButton)
        addSubview(tableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            profilImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profilImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            profilImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08),
            profilImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08),

            changePhotoButton.topAnchor.constraint(equalTo: profilImage.bottomAnchor),
            changePhotoButton.centerXAnchor.constraint(equalTo: centerXAnchor),

            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: changePhotoButton.bottomAnchor, constant: 10),

            uploadtItemButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            uploadtItemButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            uploadtItemButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 43),
            uploadtItemButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -43),
            uploadtItemButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),

            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: uploadtItemButton.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
