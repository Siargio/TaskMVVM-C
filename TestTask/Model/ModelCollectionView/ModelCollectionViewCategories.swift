//
//  ModelCellCollectionView.swift
//  TestTask
//
//  Created by Sergio on 25.03.23.
//

import UIKit

struct ModelCollectionViewCategories {
    var imageInCircle: UIImage?
    var categoriesLabel: String?
}

extension ModelCollectionViewCategories {
    static var setups: [ModelCollectionViewCategories] = [
        ModelCollectionViewCategories(
            imageInCircle: UIImage(named: "phone"),
            categoriesLabel: "Phones"),
        ModelCollectionViewCategories(
            imageInCircle: UIImage(named: "sounds"),
            categoriesLabel: "Headphones"),
        ModelCollectionViewCategories(
            imageInCircle: UIImage(named: "games"),
            categoriesLabel: "Games"),
        ModelCollectionViewCategories(
            imageInCircle: UIImage(named: "cars"),
            categoriesLabel: "Cars"),
        ModelCollectionViewCategories(
            imageInCircle: UIImage(named: "furniture"),
            categoriesLabel: "Furniture"),
        ModelCollectionViewCategories(
            imageInCircle: UIImage(named: "kids"),
            categoriesLabel: "Kids")]
}
