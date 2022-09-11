//
//  UsersListViewInput.swift
//  UsersList
//
//  Created by Clarence Montenegro on 10/09/2022.
//

protocol UsersListViewInput: AnyObject {

    func setUpInitialState()
    func moduleInput() -> UsersListModuleInput
}
