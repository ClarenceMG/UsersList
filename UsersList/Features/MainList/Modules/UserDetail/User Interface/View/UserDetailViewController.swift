//
//  UserDetailViewController.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

import UIKit

class UserDetailViewController: UIViewController {

    var output: UserDetailViewOutput!
    
    var userPosts: [UserPost] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    
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

extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        var content = cell.defaultContentConfiguration()
        
        content.text = userPosts[indexPath.row].title
        content.secondaryText = userPosts[indexPath.row].body
        content.secondaryTextProperties.color = .darkGray
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return MainList.Common.publications
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
    
    func updatePosts(posts: [UserPost]) {
        userPosts = posts
    }
}
