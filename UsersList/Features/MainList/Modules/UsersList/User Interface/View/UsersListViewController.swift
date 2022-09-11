//
//  UsersListViewController.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

import UIKit

class UsersListViewController: UIViewController {

    var output: UsersListViewOutput!


    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

	    // TODO: View set up code goes here. Please remove this comment.

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
