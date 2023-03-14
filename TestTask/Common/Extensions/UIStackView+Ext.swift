//
//  UIStackView+Ext.swift
//  TestTask
//
//  Created by Sergio on 14.03.23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
}
