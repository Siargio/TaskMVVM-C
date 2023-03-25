//
//  HouseView.swift
//  TestTask
//
//  Created by Sergio on 20.03.23.
//

import UIKit

final class HousesView: UIView {

    // MARK: - UIElements

    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.isTranslucent = true
        searchBar.searchTextField.layer.cornerRadius = 18
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    private let locationButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "imageLocation")
        button.setImage(image, for: .normal)
        button.setTitle("Location", for: .normal)
        button.setTitleColor(CommonColor.textColorSearchBarPlaceholder, for: .normal)
        button.titleLabel?.font = UIFont.montserratRegular14()
        button.imageEdgeInsets.left = +75
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let collectionViewCategories: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.minimumInteritemSpacing = 30
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(CollectionViewCategories.self, forCellWithReuseIdentifier: CollectionViewCategories.identifier)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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

    func searchText(to searchBar: UISearchBar, placeHolderText: String) {
        //searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        let searchTextField: UITextField = searchBar.value(forKey: "searchField") as? UITextField ?? UITextField()
        
        //searchTextField.textAlignment = NSTextAlignment.left
        let image = UIImage(systemName: "magnifyingglass")
        let imageView = UIImageView.init(image: image)
        imageView.tintColor = .gray
        searchTextField.leftView = nil
        searchTextField.font = .montserratRegular14()
        searchTextField.attributedPlaceholder = NSAttributedString(string: placeHolderText, attributes: [NSAttributedString.Key.foregroundColor: CommonColor.textColorSearchBarPlaceholder])
        searchTextField.addSubview(imageView)
        imageView.frame = CGRect(x: 240, y: 7, width: 20, height: 20)
        //searchTextField.rightView = imageView
        searchTextField.backgroundColor = CommonColor.backgroundColorSearchBar
        //searchTextField.rightViewMode = UITextField.ViewMode.always

        let searchBarWidth = self.frame.width
        let placeHolderWidth = searchTextField.attributedPlaceholder?.size().width
        let offset = UIOffset(horizontal: ((searchBarWidth / 2) - (placeHolderWidth! / 0.8)), vertical: 0)
        searchBar.setPositionAdjustment(offset, for: .search)
    }

    private func setupHierarchy() {
        addSubview(searchBar)
        addSubview(locationButton)
        addSubview(collectionViewCategories)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            locationButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            locationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            locationButton.widthAnchor.constraint(equalToConstant: 80),

            searchBar.topAnchor.constraint(equalTo: locationButton.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 56),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -56),

            collectionViewCategories.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            collectionViewCategories.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            collectionViewCategories.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            collectionViewCategories.heightAnchor.constraint(equalToConstant: 65),

        ])
    }
}
