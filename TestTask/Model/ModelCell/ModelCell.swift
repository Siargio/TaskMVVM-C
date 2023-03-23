//
//  ModelCell.swift
//  TestTask
//
//  Created by Sergio on 22.03.23.
//

import UIKit

struct Setups {
    var imageInCircle: UIImage?
    var labelInfo: String?
    var chevron: UIImage?
}

extension Setups {
    static var setups: [Setups] = [
        Setups(imageInCircle: UIImage(systemName: "creditcard"),
               labelInfo: " Trade store",
               chevron: UIImage(named: "chevron")),
        Setups(imageInCircle: UIImage(systemName: "creditcard"),
               labelInfo: "Payment method",
               chevron: UIImage(named: "chevron")),
        Setups(imageInCircle: UIImage(systemName: "creditcard"),
               labelInfo: "Balance"),
        Setups(imageInCircle: UIImage(systemName: "creditcard"),
               labelInfo: "Trade history",
               chevron: UIImage(named: "chevron")),
        Setups(imageInCircle: UIImage(systemName: "repeat.circle"),
               labelInfo: "Restore Purchase",
               chevron: UIImage(named: "chevron")),
        Setups(imageInCircle: UIImage(systemName: "questionmark.circle"),
               labelInfo: "Help"),
        Setups(imageInCircle: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
               labelInfo: "Log out")]
}
