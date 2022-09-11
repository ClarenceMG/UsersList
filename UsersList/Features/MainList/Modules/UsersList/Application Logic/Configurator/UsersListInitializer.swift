//
//  UsersListInitializer.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

import Foundation

class UsersListModuleInitializer: NSObject {

    // TODO: Connect with object on storyboard
    @IBOutlet weak var usersListViewController: UsersListViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        let configurator = UsersListModuleConfigurator()
        configurator.configureModuleForViewInput(usersListViewController)
    }
}
