//
//  UsersListInteractorOutput.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

protocol UsersListInteractorOutput: AnyObject {
    
    func didRetrieveUsers(users: [UserInfoElement])
    func didFailRetrievingUsers(title: String, message: String)
}
