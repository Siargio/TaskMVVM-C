//
//  UIViewCircle.swift
//  TestTask
//
//  Created by Sergio on 22.03.23.
//

import UIKit

final class CircleView: UIView {

    let circleView: UIImageView = {
        let image = UIImage(named: "circle")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        addSubview(circleView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: topAnchor),
            circleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            circleView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
