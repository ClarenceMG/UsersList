//
//  UserDetailViewController.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

import UIKit

class UserDetailViewController: UIViewController {

    var output: UserDetailViewOutput!

    
    // MARK: IBOutlets
    
    @IBOutlet weak var userInfoView: UIView! {
        didSet {
            userInfoView.layer.cornerRadius = 6
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            
        }
    }
    
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = MainList.Common.userDetailInfo

        output.viewIsReady()
    }
}


// MARK: UserDetailViewInput Methods

extension UserDetailViewController: UserDetailViewInput {

    func setUpInitialState(user: UserInfoElement) {
        nameLabel.text = user.name
        phoneLabel.text = user.phone
        emailLabel.text = user.email
    }

    func moduleInput() -> UserDetailModuleInput {
        return output as! UserDetailModuleInput
    }
}
