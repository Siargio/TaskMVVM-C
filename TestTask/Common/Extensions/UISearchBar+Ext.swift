//
//  UISearchBar+Ext.swift
//  TestTask
//
//  Created by Sergio on 23.03.23.
//

import UIKit

extension UISearchBar {

    func setCenteredPlaceHolder() {
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField

        //get the sizes
        let searchBarWidth = self.frame.width
        let placeholderIconWidth = textFieldInsideSearchBar?.leftView?.frame.width
        let placeHolderWidth = textFieldInsideSearchBar?.attributedPlaceholder?.size().width
        let offsetIconToPlaceholder: CGFloat = 20
        let placeHolderWithIcon = placeholderIconWidth! + offsetIconToPlaceholder

        let offset = UIOffset(horizontal: ((searchBarWidth / 2) - (placeHolderWidth! / 2) - placeHolderWithIcon), vertical: 0)
        self.setPositionAdjustment(offset, for: .search)
    }
}
