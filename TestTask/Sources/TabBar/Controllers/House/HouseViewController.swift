//
//  HouseViewController.swift
//  TestTask
//
//  Created by Sergio on 20.03.23.
//

import UIKit

final class HouseViewController: UIViewController {

    // MARK: - Property

    private let customView = HousesView()

    // MARK: - LifeCycle

    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    override func viewDidLayoutSubviews() {
        customView.searchText(to: customView.searchBar, placeHolderText: "What are you looking for?")
    }
    
    // MARK: - Setups


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
