//
//  UserDetailViewInput.swift
//  UsersList
//
//  Created by Clarence Montenegro on 11/09/2022.
//

protocol UserDetailViewInput: AnyObject {

    func setUpInitialState(user: UserInfoElement)
    func moduleInput() -> UserDetailModuleInput
    func updatePosts(posts: [UserPost])
    func showError(title: String, message: String)
}
