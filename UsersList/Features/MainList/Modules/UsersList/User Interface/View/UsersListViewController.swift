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
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = MainList.Common.users
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        output.viewIsReady()
    }
}


// MARK: UsersListViewInput Methods

extension UsersListViewController: UsersListViewInput {

    func setUpInitialState() {
    }

    func moduleInput() -> UsersListModuleInput {
        return output as! UsersListModuleInput
    }
}


// MARK: UISearchResultsUpdating Methods

extension UsersListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        // TODO: Update the users list based on search text
        debugPrint(text)
    }
}


// MARK: UITableViewDataSource

extension UsersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


// MARK: UITableViewDelegate

extension UsersListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Item \(indexPath.row) was tapped")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
