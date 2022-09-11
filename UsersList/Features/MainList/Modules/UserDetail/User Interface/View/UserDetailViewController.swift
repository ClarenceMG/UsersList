//
//  UserDetailViewController.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

import UIKit

class UserDetailViewController: UIViewController {

    var output: UserDetailViewOutput!


    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

	    // TODO: View set up code goes here. Please remove this comment.

        output.viewIsReady()
    }
}


// MARK: UserDetailViewInput Methods

extension UserDetailViewController: UserDetailViewInput {

    func setUpInitialState() {
    }

    func moduleInput() -> UserDetailModuleInput {
        return output as! UserDetailModuleInput
    }
}
