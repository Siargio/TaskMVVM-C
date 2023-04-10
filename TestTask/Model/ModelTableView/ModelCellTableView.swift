//
//  ModelCell.swift
//  TestTask
//
//  Created by Sergio on 22.03.23.
//

import UIKit

enum CellType {
    case baseCell
    case chevronCell
    case balanceCell
}

struct SetupSections {
    var sectionsNumber: Int
    var setupsItem: [Setups]
}

struct Setups {
    var imageInCircle: UIImage?
    var labelInfo: String?
    var chevron: UIImage?
    var balance: String?
    var cellType: CellType
}

extension SetupSections {
    static var setupSections: [SetupSections] = [
        SetupSections(sectionsNumber: 0, setupsItem: [
            Setups(imageInCircle: UIImage(systemName: "creditcard"),
                   labelInfo: " Trade store",
                   chevron: UIImage(named: "chevron"),
                   cellType: .chevronCell),
            Setups(imageInCircle: UIImage(systemName: "creditcard"),
                   labelInfo: "Payment method",
                   chevron: UIImage(named: "chevron"),
                   cellType: .chevronCell),
            Setups(imageInCircle: UIImage(systemName: "creditcard"),
                   labelInfo: "Balance",
                   balance: "$ 1593",
                   cellType: .balanceCell),
            Setups(imageInCircle: UIImage(systemName: "creditcard"),
                   labelInfo: "Trade history",
                   chevron: UIImage(named: "chevron"),
                   cellType: .chevronCell),
            Setups(imageInCircle: UIImage(systemName: "repeat.circle"),
                   labelInfo: "Restore Purchase",
                   chevron: UIImage(named: "chevron"),
                   cellType: .chevronCell),
            Setups(imageInCircle: UIImage(systemName: "questionmark.circle"),
                   labelInfo: "Help",
                   cellType: .baseCell)]),

        SetupSections(sectionsNumber: 1, setupsItem: [
            Setups(imageInCircle: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
                   labelInfo: "Log out",
                   cellType: .baseCell)])
    ]
}



//
//        Setups(imageInCircle: UIImage(systemName: "creditcard"),
//               labelInfo: " Trade store",
//               chevron: UIImage(named: "chevron"),
//               cellType: .chevronCell),
//        Setups(imageInCircle: UIImage(systemName: "creditcard"),
//               labelInfo: "Payment method",
//               chevron: UIImage(named: "chevron"),
//               cellType: .chevronCell),
//        Setups(imageInCircle: UIImage(systemName: "creditcard"),
//               labelInfo: "Balance",
//               balance: "$ 1593",
//               cellType: .balanceCell),
//        Setups(imageInCircle: UIImage(systemName: "creditcard"),
//               labelInfo: "Trade history",
//               chevron: UIImage(named: "chevron"),
//               cellType: .chevronCell),
//        Setups(imageInCircle: UIImage(systemName: "repeat.circle"),
//               labelInfo: "Restore Purchase",
//               chevron: UIImage(named: "chevron"),
//               cellType: .chevronCell),
//        Setups(imageInCircle: UIImage(systemName: "questionmark.circle"),
//               labelInfo: "Help",
//               cellType: .baseCell),
//        Setups(imageInCircle: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
//               labelInfo: "Log out",
//               cellType: .baseCell)]
//}
