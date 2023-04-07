//
//  HouseViewController.swift
//  TestTask
//
//  Created by Sergio on 20.03.23.
//

import UIKit

final class HouseViewController: UIViewController {

    // MARK: - Property
    private let modelCategories = ModelCollectionViewCategories.setups
    private let customView = HousesView()

    // MARK: - LifeCycle

    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        delegateCollectionView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    override func viewDidLayoutSubviews() {
        customView.searchText(to: customView.searchBar, placeHolderText: "What are you looking for?")
    }
    
    // MARK: - Setups

    private func delegateCollectionView() {
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self

    }
}

// MARK: - SetupsNavigationBar

extension HouseViewController {

    func setupNavigationBar() {
        navigationTitle()
        navigationImage()
        self.tabBarController?.navigationController?.navigationBar.tintColor = .black
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "leftButton"), style: .done, target: nil, action: nil)
    }

    private func navigationTitle() {
        let title = "Trade by"
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.montserratBold22()
        ]
        let attributedString = NSMutableAttributedString(string: title, attributes: attrs as [NSAttributedString.Key : Any])

        let subtitle = "bata"
        let subtitleAttrs = [
            NSAttributedString.Key.foregroundColor: CommonColor.customPurpleButton,
            NSAttributedString.Key.font: UIFont.montserratBold22()
        ]
        let subtitleAttributedString = NSAttributedString(string: " \(subtitle)", attributes: subtitleAttrs as [NSAttributedString.Key : Any])
        attributedString.append(subtitleAttributedString)

        let titleLabel = UILabel()
        titleLabel.attributedText = attributedString
        titleLabel.textAlignment = .center

        self.tabBarController?.navigationItem.titleView = titleLabel
    }

    private func navigationImage() {
        var image = UIImage(named: "personPhoto")
        image = image?.withRenderingMode(.alwaysOriginal)
        let customView = UIImageView(image: image)
        customView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        let barButtonItem = UIBarButtonItem(customView: customView)

        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        space.width = 35

        self.tabBarController?.navigationItem.rightBarButtonItems = [
            space, barButtonItem]
    }
}

// MARK: - UICollectionViewDelegate

extension HouseViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            let section = modelCategories.count
            return section
        case 1:
            return 15
        case 2:
            return 15
        default:
            return 13
        }
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCategories.identifier, for: indexPath) as? CollectionViewCategories else {
                return UICollectionViewCell()
            }
            let cellData = modelCategories[indexPath.item]

            cell.categoriesLabel.text = cellData.categoriesLabel
            cell.imageInImageCircle.image = cellData.imageInCircle
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewLatest.identifier, for: indexPath) as? CollectionViewLatest else {
                return UICollectionViewCell()
            }
            
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewFlashSale.identifier, for: indexPath) as? CollectionViewFlashSale else {
                return UICollectionViewCell()
            }

            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewBrands.identifier, for: indexPath) as? CollectionViewBrands else {
                return UICollectionViewCell()
            }

            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch indexPath.section {
        case 1:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else {
                return UICollectionReusableView()
            }
            header.title.text = "Latest"
            return header
        case 2:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else {
                return UICollectionReusableView()
            }
            header.title.text = "Flash Sale"
            return header
        default:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else {
                return UICollectionReusableView()
            }
            header.title.text = "Brands"
            return header
        }
    }
}
