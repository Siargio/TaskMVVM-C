//
//  UIImage+Ext.swift
//  TestTask
//
//  Created by Sergio on 13.03.23.
//

import UIKit

extension UIImageView {
    convenience init(image: String) {
        self.init()

        let image = UIImage(named: image)
        self.image = image
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func setRounded() {
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.systemGray.cgColor
        self.layer.borderWidth = 1
    }
}
