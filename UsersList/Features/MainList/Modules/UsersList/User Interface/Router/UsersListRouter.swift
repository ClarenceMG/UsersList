//
//  UsersListRouter.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

import Foundation
import UIKit

class UsersListRouter: UsersListRouterInput {
    
    weak var viewController: UsersListViewController!
    
    func routeToDetail(user: UserInfoElement) {
        
        let bundle = Bundle(for: UserDetailViewController.self)
        let storyBoard = UIStoryboard(name: "Main", bundle: bundle)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        
        detailViewController.moduleInput().initializeModule(user: user)
        
        viewController.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
