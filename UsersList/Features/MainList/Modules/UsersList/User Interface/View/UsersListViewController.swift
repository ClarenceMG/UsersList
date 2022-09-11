//
//  UsersListViewController.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

import UIKit

class UsersListViewController: UIViewController {

    var output: UsersListViewOutput!

    var searchController = UISearchController()
    
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UserTableViewCell.nib, forCellReuseIdentifier: UserTableViewCell.reuseIdentifier)
        }
    }
    
    
    //MARK: variables
    var usersList: [UserInfoElement] = [] {
        didSet {
            usersFilteredList = usersList
            tableView.reloadData()
        }
    }
    
    var usersFilteredList: [UserInfoElement] = []
    var filtered: Bool = false
    var label = UILabel()
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = MainList.Common.users
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = MainList.Common.searchUsers
        navigationItem.searchController = searchController
        
        output.viewIsReady()
    }
    
    func addMessageEmptyList() {
        label.frame = CGRect(x: 0, y: (view.frame.width / 2) - 50, width: view.frame.width, height: 30)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17)
        label.text = MainList.Common.emptyList
        label.isHidden = true
        
        view.addSubview(label)
    }
    
    func showEmptyListMessage() {
        label.isHidden = false
    }
    
    func hideEmptyListMessage() {
        label.isHidden = true
    }
}


// MARK: UsersListViewInput Methods

extension UsersListViewController: UsersListViewInput {

    func setUpInitialState() {
        addMessageEmptyList()
    }

    func moduleInput() -> UsersListModuleInput {
        return output as! UsersListModuleInput
    }
    
    func updateUsersList(users: [UserInfoElement]) {
        usersList = users
    }
    
    func showError(title: String, message: String) {
        // TODO: Show error message
    }
}


// MARK: UISearchResultsUpdating Methods

extension UsersListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        if text.isEmpty {
            usersFilteredList = usersList
        } else {
            usersFilteredList = usersList.filter({ $0.name.contains(text) })
        }
        
        filtered = true
        
        if usersFilteredList.isEmpty {
            showEmptyListMessage()
        } else {
            hideEmptyListMessage()
        }
        
        tableView.reloadData()
    }
}


// MARK: UITableViewDataSource

extension UsersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !usersFilteredList.isEmpty {
            return usersFilteredList.count
        }
        
        return filtered ? 0 : usersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath) as! UserTableViewCell
        
        let user = usersFilteredList.isEmpty ? usersList[indexPath.row] : usersFilteredList[indexPath.row]

        cell.configure(user: user)
        return cell
    }
}


// MARK: UITableViewDelegate

extension UsersListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let user = usersFilteredList.isEmpty ? usersList[indexPath.row] : usersFilteredList[indexPath.row]
        
        output.routeToDetail(user: user)
    }
}
