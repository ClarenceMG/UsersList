//
//  UserDetailInitializer.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

import Foundation

class UserDetailModuleInitializer: NSObject {

    @IBOutlet weak var userDetailViewController: UserDetailViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        let configurator = UserDetailModuleConfigurator()
        configurator.configureModuleForViewInput(userDetailViewController)
    }
}
