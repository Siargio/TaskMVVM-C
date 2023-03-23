//
//  PersonViewController.swift
//  TestTask
//
//  Created by Sergio on 20.03.23.
//

import UIKit

final class PersonViewController: UIViewController {

    // MARK: - Property
    
    private let customView = PersonView()
    private let data = Setups.setups

    // MARK: - LifeCycle

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        customView.profilImage.setRounded()
    }

    override func viewDidLayoutSubviews() {
        // Enable scrolling based on content height
        customView.tableView.isScrollEnabled = customView.tableView.contentSize.height > customView.tableView.frame.size.height
     }
    
    // MARK: - Setups

    func setupNavigationBar() {
        self.tabBarController?.navigationItem.title = "Profile"
    }

    func delegate() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }

}

// MARK: - UITableViewDelegate UITableViewDataSource

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let cellData = data[indexPath.row]
        cell.configuration(data: cellData)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
}
