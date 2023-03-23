//
//  HouseView.swift
//  TestTask
//
//  Created by Sergio on 20.03.23.
//

import UIKit

final class HousesView: UIView {
    
    // MARK: - UIElements

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "What are you looking for?"
        searchBar.searchBarStyle = .minimal
        //searchBar.searchTextField.backgroundColor = CommonColor.backgroundColorSearchBar
        searchBar.setCenteredPlaceHolder()
        searchBar.searchTextField.layer.cornerRadius = 18
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        backgroundColor = CommonColor.backgroundColor

        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(searchBar)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 56),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -56)
        ])
    }
}
