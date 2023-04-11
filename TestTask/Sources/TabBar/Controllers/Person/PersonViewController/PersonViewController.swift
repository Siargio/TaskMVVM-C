//
//  PersonViewController.swift
//  TestTask
//
//  Created by Sergio on 20.03.23.
//

import UIKit

final class PersonViewController: UIViewController {
    // MARK: - Property
    
    let appDelegate = AppDelegate()
    private let customView = PersonView()
    private let data = SetupSections.setupSections

    // MARK: - LifeCycle

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate()
        creatingActionButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        customView.profileImage.setRounded()
    }

    override func viewDidLayoutSubviews() {
        // Enable scrolling based on content height
        customView.tableView.isScrollEnabled = customView.tableView.contentSize.height > customView.tableView.frame.size.height
     }
    
    // MARK: - Setups

    func setupNavigationBar() {
        navigationItem.title = "Profile"
    }

    private func creatingActionButton() {
        customView.changePhotoButton.addTarget(self, action: #selector(tapChangeButton), for: .touchUpInside)
    }
    
    func delegate() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }

    private func didTapLogout() {
        //UserDefaults.standard.removeObject(forKey: "userLogged")
        appDelegate.check()
    }

    @objc private func tapChangeButton() {
        showImagePickerController()
    }
}

// MARK: -

extension PersonViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private func showImagePickerController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            customView.profileImage.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            customView.profileImage.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate UITableViewDataSource

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data[section].setupsItem.count
    }

    func universalСell<T: UITableViewCell>(cell: T,
                                           _ indexPath: IndexPath,
                                           _ tableView: UITableView) -> T {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as? T
        else { return UITableViewCell() as? T ?? cell}
        return cell
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellData = data[indexPath.section].setupsItem[indexPath.item]

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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if data[indexPath.section].sectionsNumber == 1 {
            UserDefaults.standard.removeObject(forKey: "userLogged")
            didTapLogout()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
