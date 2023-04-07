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

    func universalСell<T: UITableViewCell>(cell: T,
                                           _ indexPath: IndexPath,
                                           _ tableView: UITableView) -> T {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as? T
        else { return UITableViewCell() as? T ?? cell}
        return cell
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellData = data[indexPath.row]

        switch cellData.cellType {

        case .baseCell:
            let cell = universalСell(
                cell: BaseCell(),
                indexPath, tableView)
            cell.configuration(data: cellData)
            return cell

        case .chevronCell:
            let cell = universalСell(
                cell: CellWithChevron(),
                indexPath, tableView)
            cell.configuration(data: cellData)
            return cell

        case .balanceCell:
            let cell = universalСell(
                cell: BalanceCell(),
                indexPath, tableView)
            cell.configuration(data: cellData)
            cell.selectionStyle = .none
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
