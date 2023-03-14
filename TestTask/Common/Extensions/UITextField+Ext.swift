//
//  UITextField+Ext.swift
//  TestTask
//
//  Created by Sergio on 13.03.23.
//

import UIKit

extension UITextField {
    convenience init(placeholder: String) {
        self.init()

        self.backgroundColor = CommonColor.customGray
        self.textAlignment = .center
        self.layer.cornerRadius = 17
        self.translatesAutoresizingMaskIntoConstraints = false

        let attributes = [
            NSAttributedString.Key.foregroundColor: CommonColor.customGrayTex,
            NSAttributedString.Key.font : UIFont(name: "Montserrat-Light", size: 12)!
        ]

        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:attributes)
    }
}
