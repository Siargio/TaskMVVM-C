//
//  CustomNavigationBar.swift
//  TestTask
//
//  Created by Sergio on 23.03.23.
//

import UIKit

class CustomNavigationBar: UINavigationController {

    private let leftButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "leftButton")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Trade by bata"
        label.font = .montserratBold15()

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fotoImage: UIImageView = {
        let image = UIImage(named: "circle")
        let imageView = UIImageView(image: image)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.barTintColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        view.addSubview(leftButton)
        view.addSubview(labelTitle)
        view.addSubview(fotoImage)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            leftButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),

            labelTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            fotoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fotoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
}
