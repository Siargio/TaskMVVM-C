//
//  UIButton+Ext.swift
//  TestTask
//
//  Created by Sergio on 13.03.23.
//

import UIKit

extension UIButton {
    convenience init(text: String, font: UIFont?, tintColor: UIColor, backgroundColor: UIColor) {
        self.init(type: .system)

        self.setTitle(text, for: .normal)
        self.titleLabel?.font = font
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
